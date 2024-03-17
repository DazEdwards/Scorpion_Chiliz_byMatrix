import 'package:flutter/material.dart';

class StudentQueryService extends StatefulWidget {
  @override
  StudentQueryServiceState createState() => StudentQueryServiceState();
}

class StudentQueryServiceState extends State<StudentQueryService>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController _textEditingController = TextEditingController();
  List<ChatMessage> _chatMessages = [];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    // Other animation code remains the same

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: 1),
        Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    hintText: 'Type your question...',
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _sendMessage() {
    String message = _textEditingController.text;
    if (message.isNotEmpty) {
      setState(() {
        _textEditingController.clear();
        _chatMessages.add(ChatMessage(text: message, isUser: true));
        // Simulate a response from the bot (replace this with actual logic)
        _chatMessages.add(ChatMessage(
          text: 'I am a bot. Your message: "$message"',
          isUser: false,
        ));
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isUser ? Colors.blue : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isUser ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}