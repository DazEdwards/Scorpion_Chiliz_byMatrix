const express = require('express');
const multer = require('multer');
const axios = require('axios');
const OpenAI = require("openai");
const fs = require('fs');
const fs_promises = require('fs').promises;
const path = require('path');
const cors = require('cors');
const AdmZip = require('adm-zip');
const { v4: uuidv4 } = require('uuid');

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());
app.use(express.static('public'));  

// Set up Multer to handle file uploads
const storage = multer.memoryStorage(); // Store the file in memory
const upload = multer({ storage: storage });

const tasksFilePath = path.join(__dirname, 'tasks.json');

async function readTasks() {
  try {
      const data = await fs_promises.readFile(tasksFilePath, { encoding: 'utf8' });
      return JSON.parse(data);
  } catch (error) {
      if (error.code === 'ENOENT') {
          // If the file doesn't exist, create it with an empty object
          await fs_promises.writeFile(tasksFilePath, JSON.stringify({}, null, 2), 'utf8');
          return {};
      } else {
          throw error;
      }
  }
}

async function call_elevenlabds(text, avatar_id) {

  console.log("Calling elevenlabs API...");
  try{

    const options = {
      method: 'POST',
      url: `https://api.elevenlabs.io/v1/text-to-speech/${avatar_id}`,
      headers: {
        accept: 'audio/mpeg', 
        'content-type': 'application/json',
        'xi-api-key': `${process.env.API_KEY}`, 
      },
      data: {
        text: text, 
      },
      responseType: 'arraybuffer',
    };
  
    const speechDetails = await axios.request(options);

    return speechDetails.data;
  } catch(c) {

    return false;
  }

}

app.post('/synthsize', async(req, res) => {
  console.log(req.body);
  let text = req.body.text;
  let avatar_id_index = req.body.avatar_id;

  let avatar_id = (avatar_id_index == 0) ? "21m00Tcm4TlvDq8ikWAM" : "D38z5RcWu1voky8WS1ja";

  try {
    let buffer = await call_elevenlabds(text, avatar_id);

    const publicFolderPath = path.join(__dirname, 'public');
    fs.writeFile(path.join(publicFolderPath, 'audio.mp3'), buffer, (err) => {
      if (err) {
        console.error('Error writing MP3 file:', err);
        res.status(500).json({ success: false, error: 'Error writing MP3 file' });
      } else {
        console.log('MP3 file saved successfully');
        res.json({ success: true });
      }
    });
  } catch(e) {
    console.error('Error synthesizing speech:', e);
    res.status(500).json({ success: false, error: 'Error synthesizing speech' });
  }
});

async function writeTasks(tasks) {
  await fs_promises.writeFile(tasksFilePath, JSON.stringify(tasks, null, 2), 'utf8');
}

async function downloadFile(url, dest) {
  const response = await axios({
    method: 'GET',
    url: url,
    responseType: 'stream'
  });
  
  response.data.pipe(fs.createWriteStream(dest));

  return new Promise((resolve, reject) => {
    response.data.on('end', () => {
      console.log("File downloaded successfully");
      resolve();
    });

    response.data.on('error', (err) => {
      console.error('Error downloading file...')
      reject(err);
    });
  });
}

async function importFileToAssistantByCIDTask(taskId, cid) {
  console.log("Starting file import by CID...");

  const tempDir = path.join(__dirname, 'tempDir');
  if (!fs.existsSync(tempDir)) {
    fs.mkdirSync(tempDir);
  }

  const tempFileName = `cid_${cid}.docx`;
  const tempFilePath = path.join(tempDir, tempFileName);

  await downloadFile(`https:/${cid}.ipfs.nftstorage.link`, tempFilePath);

  const openaiFileUploadedWithSuccess = await sendFileToOpenAI(tempFilePath);

  const tasks = await readTasks();
  tasks[taskId] = { status: openaiFileUploadedWithSuccess ? 'success' : 'failed'  };
  await writeTasks(tasks);

  return openaiFileUploadedWithSuccess
}


app.get('/ping', async(req, res) => {
  res.json({ success: true, 'ping': 'ok' });
})

// Endpoint to get all tasks
app.get('/tasks', async (req, res) => {
  try {
      const tasks = await readTasks();
      res.json(tasks);
  } catch (error) {
      res.status(500).send('Failed to retrieve tasks');
  }
});

// Endpoint to check the status of a task
app.get('/status/:taskId', async (req, res) => {
    const { taskId } = req.params;
    const tasks = await readTasks();
    const task = tasks[taskId];
    if (task) {
        res.json({ taskId, status: task.status });
    } else {
        res.status(404).send('Task not found');
    }
});


app.get('/import_cid', async(req, res) => {
  const taskId = uuidv4() + "-" + Date.now().toString();
  const tasks = await readTasks();
  
  tasks[taskId] = { status: 'in_progress' };
  await writeTasks(tasks);

  setTimeout(() => importFileToAssistantByCIDTask(taskId, req.query.cid));

  res.json({ taskId });

});




// Handle file uploads
app.post('/upload', upload.single('file'), async (req, res) => {
  try {
    const fileBuffer = req.file.buffer;

    const tempDir = path.join(__dirname, 'tempDir');
    if (!fs.existsSync(tempDir)) {
      fs.mkdirSync(tempDir);
    }

    // Get the file extension from the original file name
    const fileExtension = path.extname(req.file.originalname);

    // Append the file extension to the temporary file name
    const tempFileName = 'tempfile' + fileExtension;
    const tempFilePath = path.join(tempDir, tempFileName);

    fs.writeFileSync(tempFilePath, fileBuffer);

    await sendFileToOpenAI(tempFilePath);

    res.json({ success: true, openaiFile });
  } catch (error) {
    console.error("Error uploading file:", error);
    res.status(500).json({ success: false, error: "Internal Server Error" });
  }
});


async function sendFileToOpenAI(filePath) {

  const openaiApiKey = proces.env.OPENAI_API_KEY;
  const assistantId = 'asst_SsJNI0SR9DNQpPkSW0UrJICh';
  const openai = new OpenAI({ apiKey: openaiApiKey });

  try{

    let response1 = await openai.files.create({
      file: fs.createReadStream(filePath),
      purpose: "assistants",
    });

    console.log(response1)
  
    let response2 = await openai.beta.assistants.files.create(
      assistantId,
      {
        file_id: response1.id
      }
    );
    
    console.log(response2);
    return true;

  } catch(c) {
    console.log(c);
    return false;
  }

}

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
