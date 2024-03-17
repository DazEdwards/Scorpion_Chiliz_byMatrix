import 'dart:convert';
import 'package:eb_hy/utils/voice_api.dart';
import 'package:elevenlabs_flutter/elevenlabs_config.dart';
import 'package:elevenlabs_flutter/elevenlabs_types.dart';
import 'package:flutter/material.dart';
import 'dart:isolate';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'bot_setting_page.dart';
import 'package:elevenlabs_flutter/elevenlabs_flutter.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TaikPage extends StatefulWidget {
  const TaikPage({super.key});

  @override
  TaikPageState createState() => TaikPageState();
}


class TaikPageState extends State<TaikPage> {
  VoiceApi voiceApi = VoiceApi();
  int index = 0;
  final elevenLabs = ElevenLabsAPI();

  AudioPlayer audioPlayer = AudioPlayer();
  late VideoPlayerController controller;

  bool isPanelVisible = false;
  final List<Item> _data = generateItems(3);
  int selectedChat = -1;
  List<Widget> chats = [];

  bool _isLoading = false;
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  changeAssistant() {
    setState(() {
      index = 1;
    });
    // controller = VideoPlayerController.asset('assets/svg/professor_animated_1.mp4')
    //   ..addListener(() {})
    //   ..setLooping(true)
    //   ..initialize().then((_) {
    //     controller.play();
    //   });

  }

  late Timer _timer;
  final String JWT =
      "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTUxMiIsInR5cCI6IkpXVCJ9.eyJJRCI6IjMiLCJFTUFJTCI6IiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkdVRVNUIiwiZXhwIjoxNzA1MzUwMzI0fQ.yBbBI7CZJE386JVfRT5FCMtgGRaKLVnuUVolYC_f5IcWh3G2Q6944tTL2aOGvqlHwd3n7U3EhhD8qhGIrbUk6g";
  String thread_id = "";

  final List<ChatMessage> _messages = [
    const ChatMessage(
        sender: 'Bot',
        message: 'Hey Amrit! Man Utd is currently 6th in Premier League standings with 47. Want to learn more about team\'s latest news? Ask me!',
        isUser: false),
    // Add more messages as needed
  ];

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // controller = VideoPlayerController.asset('assets/svg/professor_animated_2.mp4')
    //   ..addListener(() {})
    //   ..setLooping(true)
    //   ..initialize().then((_) {
    //       controller.play();
    //   });
    setUpElevenVoiceApi();
    _checkThreadId();
  }

  Future<void> setUpElevenVoiceApi() async {

    const String elevenLabsKey = "test";
    elevenLabs.init(config: const ElevenLabsConfig(apiKey: elevenLabsKey, baseUrl: "https://api.elevenlabs.io"));
  }


  _checkThreadId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String thread_id = "-1";
    if (prefs.containsKey('thread_id')) {
      thread_id = prefs.getString('thread_id') ?? "-1";
    } else {
      prefs.setString('thread_id', thread_id);
    }
    setState(() {
      thread_id = thread_id;
    });
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 10),
          child: Container(
              margin: const EdgeInsets.only(left: 10), child: _body(context)),
        )
      ],
    ));
  }

  Widget _body(BuildContext context) {
    if (selectedChat != -1) {
      return chat1();
    }

    return Row(children: [
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red, // Use the specified color
                    offset: Offset(1, 2), // Set X and Y offsets to 0
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/svg/espnlogo.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 12, width: 60),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red, // Use the specified color
                    offset: Offset(1, 2), // Set X and Y offsets to 0
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/svg/man_city_logo.jpg'),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red, // Use the specified color
                    offset: Offset(1, 2), // Set X and Y offsets to 0
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/svg/SPORTbible_logo.jpg'),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red, // Use the specified color
                    offset: Offset(0, 0), // Set X and Y offsets to 0
                    blurRadius: 4,
                    spreadRadius: 6,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/svg/manchester-united-logo-png-transparent.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red, // Use the specified color
                    offset: Offset(1, 2), // Set X and Y offsets to 0
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/svg/chelsea_logo.jpg'),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red, // Use the specified color
                    offset: Offset(1, 2), // Set X and Y offsets to 0
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/svg/nike_logo.webp'),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red, // Use the specified color
                    offset: Offset(1, 2), // Set X and Y offsets to 0
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/svg/liverpool_fc_logo.jpg'),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red, // Use the specified color
                    offset: Offset(1, 2), // Set X and Y offsets to 0
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/svg/Los_Angeles_Lakers_logo.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red, // Use the specified color
                    offset: Offset(1, 2), // Set X and Y offsets to 0
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage('assets/svg/bbc_sport_logo.jpg'),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.red, // Use the specified color
                    offset: Offset(0, 0), // Set X and Y offsets to 0
                    blurRadius: 0,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const Icon(Icons.add, color: Color(0xFF061437)),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.7,
          margin: const EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF061437),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.red, // Use the specified color
                offset: Offset(0, 0), // Set X and Y offsets to 0
                blurRadius: 1,
                spreadRadius: 0,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 10, left: 10, right: 10, top: 10),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 38,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.red, // Use the specified color
                          blurRadius: 2,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: CircleAvatar(
                              radius: 15.0,
                              backgroundImage:
                                  AssetImage('assets/svg/taik_logo.webp'),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'MANCHESTER UNITED',
                              style: TextStyle(
                                color: Color(0xFF0E204B),
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  buildList()
                ],
              ),
            ),
          ),
        ),
      )
    ]);
  }

  ExpansionPanelList buildList() {
    return ExpansionPanelList(
      expandIconColor: const Color(0xFFFFFFFF),
      animationDuration: const Duration(milliseconds: 200),
      elevation: 0,
      expandedHeaderPadding: const EdgeInsets.all(0),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          canTapOnHeader: true,
          backgroundColor: const Color(0xFF061437),
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      item.headerValue,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          body: ListTile(
              title: Column(
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage('assets/svg/taik_logo.webp'),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 10),
                  Text('Team Updates',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ))
                ],
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedChat = 0;
                  });
                },
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundImage: AssetImage('assets/svg/taik_logo.webp'),
                      backgroundColor: Colors.transparent,
                    ),
                    SizedBox(width: 10),
                    Text('Transfer Updates',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage('assets/svg/taik_logo.webp'),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 10),
                  Text('Player Interviews',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ))
                ],
              ),
            ],
          )),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  Widget chat1() {
    return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 12),
          width: MediaQuery.of(context).size.width * 0.89,
          decoration: BoxDecoration(
            color: const Color(0xFF061437),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color:
                Color.fromRGBO(152, 253, 238, 50), // Use the specified color
                offset: Offset(0, 1), // Set X and Y offsets to 0
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset("assets/svg/manchester-united-logo-png-transparent.png",
                      width: 70,
                      height: 70,
                      // fit: BoxFit.cover,
                    ),
                  ),
                  Container(

                  )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          child: ListView.builder(
            reverse: true,
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return _messages[index];
            },
          ),
        ),
        Container(
              width: MediaQuery.of(context).size.width * 0.75,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF061437),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(
                        152, 253, 238, 50), // Use the specified color
                    offset: Offset(1, 2), // Set X and Y offsets to 0
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _messageController,
                        //focusNode:  _focusNode,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11.0,
                        ),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.white24,
                            fontSize: 11.0,
                          ),
                          hintText: 'Type a message...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: _isLoading
                        ? const CircularProgressIndicator(
                      valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                        : const Icon(Icons.send, color: Colors.white),
                    onPressed: _isLoading ? null : _sendMessage,
                  ),
                ],
              ),
        ),
        Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 120),
                        child: Text(
                          "STUDENT SERVICE",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BotPageSettingsDefault()));
                            changeAssistant();
                          },
                          child: Row(
                              children: [
                                const Text("CUSTOMISE ME",
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      shadows: [
                                        Shadow(
                                          color: Colors
                                              .white, // You can set the shadow color
                                          offset: Offset(0,
                                              1), // You can adjust the shadow offset
                                          blurRadius:
                                          3, // You can adjust the blur radius
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.transparent,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.red,
                                          offset: Offset(0, 0),
                                          blurRadius: 8,
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ]))
                    ],
                  )),
              /*GestureDetector(
                onTap: () {
                  setState(() {
                    selectedChat = -1;
                  });
                },
                child: Container(
                    margin: EdgeInsets.only(left: 00, top: 20),
                    child: Icon(
                      size: 20,
                      Icons.close,
                      color: Colors.white,
                    )),
              ),*/

            ],
          ),
      ],
    ));
  }

  void playLocal(String text) async {

      await voiceApi.getVoiceFromText(text, index);
      const Duration(seconds: 2);

      Source source = UrlSource('https://nodeuploadfileworker-5aba151d8ff7.herokuapp.com/audio.mp3');
      await audioPlayer.play(source);

  }

  void _sendMessage() async {
    // final file = await elevenLabs.synthesize(
    //     TextToSpeechRequest(voiceId: "21m00Tcm4TlvDq8ikWAM", text: "Hello world!")
    //     TextToSpeechRequest(voiceId: "21m00Tcm4TlvDq8ikWAM", text: "Hello world!")
    // );


    if (_messageController.text.isNotEmpty) {
      Run run = await createThread(_messageController.text);
      poolRunStatus(run);
      setState(() {
        _isLoading = true;
        _messages.insert(
          0,
          ChatMessage(
            sender: 'User',
            message: _messageController.text,
            isUser: true,
          ),
        );
        _messageController.clear();
      });
    }
  }

  void poolRunStatus(Run run) {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      retrieveRunStatus(run);
    });
  }

  _setNewId(String threadId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('thread_id', threadId);
  }

  Future<Run> createThread(String message) async {
    const String apiUrl =
        'http://rinaldi1-001-site1.ctempurl.com/api/GPTAssistant/createRun';
    Run run = Run(thread_id: '', run_id: '');
    try {
      setState(() {
        _isLoading = true;
      });

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $JWT',
        },
        body: jsonEncode({
          'content': message,
          'phoneNumber': 'string',
          'thread_id': thread_id
        }),
      );

      print('Using thread with thread_id: ${thread_id}');
      bool setThreadId = thread_id == "-1";

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        if (responseData['succeeded'] == true) {
          String _thread_id = responseData['thread_id'];
          String run_id = responseData['run_id'];
          print('ThreadID : $thread_id');
          if (setThreadId) {
            setState(() {
              thread_id = _thread_id;
            });
            _setNewId(_thread_id);
          }

          run = Run(thread_id: _thread_id, run_id: run_id);
          return run;
        } else {}
      } else {}
    } catch (error) {
    } finally {
      return run;
    }
  }

  Future<void> retrieveRunStatus(Run run) async {
    const String apiUrl =
        'https://rinaldi1-001-site1.ctempurl.com/api/GPTAssistant/getChat';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $JWT',
        },
        body: jsonEncode({'run_id': run.run_id, 'thread_id': run.thread_id}),
      );
      print('Run thread_id: ${run.thread_id}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        if (responseData['succeeded'] == true) {
          String runStatus = responseData['run_status'];
          if (runStatus == "completed") {
            String message = responseData['chat']['messages'][0]['content'][0]
                ['text']['value'];

            playLocal(message);

            setState(() {
              _messages.insert(
                0,
                ChatMessage(
                  sender: 'Bot',
                  message: message,
                  isUser: false,
                ),
              );
              _messageController.clear();
              _isLoading = false;
              _timer.cancel();
            });
          }
        } else {}
      } else {}
    } catch (error) {
      _isLoading = false;
      _timer.cancel();
    } finally {}
  }

  Future<bool> _simulateAPICall() async {
    // Simulate API call with a delay of 2 seconds
    try {
      // Simulate some processing time
      await Future.delayed(const Duration(seconds: 2));

      // Simulate success or failure based on some condition
      bool success = true; // Change it based on your simulation needs

      return success;
    } catch (error) {
      // Handle errors if needed
      print('Error in API call: $error');
      return false;
    }
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    required this.subSections,
    this.isExpanded = true,
  });

  String expandedValue;
  String headerValue;
  List<String> subSections;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'TEAM UPDATES',
      expandedValue: '',
      subSections: ['Team News', 'Transfer Updates', 'Player Interviews'],
    );
  });
}

class ChatMessage extends StatelessWidget {
  final String sender;
  final String message;
  final bool isUser;

  const ChatMessage({super.key,
    required this.sender,
    required this.message,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: const Color(0xFF21345B),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  !isUser
                      ? Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10, right: 10),
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(
                                          0xFF98FDEE), // Use the specified color
                                      offset: Offset(
                                          1, 2), // Set X and Y offsets to 0
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  radius: 13.0,
                                  backgroundImage: AssetImage(
                                      'assets/svg/student_support_service_profile_image.webp'),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),

                            const SizedBox(
                                width:
                                    8.0), // Added spacing between CircleAvatar and Text
                            Expanded(
                              child: Text(
                                message,
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Expanded(
                              child: Text(
                                message,
                                style: const TextStyle(
                                  fontSize: 8,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(
                                          0xFF98FDEE), // Use the specified color
                                      offset: Offset(
                                          1, 2), // Set X and Y offsets to 0
                                      blurRadius: 4,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  radius: 13,
                                  backgroundImage: AssetImage(
                                      'assets/svg/student_support_service_profile_image_2.webp'),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ) // Added spacing between CircleAvatar and Text
                          ],
                        ),
                  !isUser
                      ? Container(
                          height: 20,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFF061437),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          width: MediaQuery.of(context).size.width * 0.7,
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Run {
  Run({required this.thread_id, required this.run_id});
  String thread_id;
  String run_id;
}


