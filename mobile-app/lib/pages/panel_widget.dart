import 'package:flutter/material.dart';

class PanelWidget extends StatefulWidget {
  final Function onClose;

  const PanelWidget({required this.onClose});

  @override
  _PanelWidgetState createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [
    const ChatMessage(
        sender: 'Bot', message: 'Hi Miriam! How can I help you today?', isUser: false, showAdditinalInfo:false),
    // Add more messages as needed
  ];

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 250,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: const Color(0xFF132E65),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF17397C),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: CircleAvatar(
                            radius: 15.0,
                            backgroundImage: AssetImage('assets/svg/microphone.webp'),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'tAIk',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        widget.onClose();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return _messages[index];
                  },
                ),
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF17397C),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _messageController,
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
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
        _messages.insert(
          0,
          ChatMessage(
            sender: 'User',
            message: _messageController.text,
            isUser: true,
            showAdditinalInfo: true,
          ),
        );
        _messageController.clear();
      });

      // Simulate API call with a delay of 2 seconds
      _simulateAPICall().then((success) {
        setState(() {
          _isLoading = false;
        });

        if (success) {
          setState(() {
            _messages.insert(
              0,
              const ChatMessage(
                sender: 'Thread',
                message: 'Your next exam is on the 12th of January for CS3003 Software Engineering',
                isUser: false,
                showAdditinalInfo: true,
              ),
            );
            _messageController.clear();
          });
        } else {
          // Handle API call failure if needed
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
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

class ChatMessage extends StatelessWidget {
  final String sender;
  final String message;
  final bool isUser;
  final bool showAdditinalInfo;

  const ChatMessage({super.key,
    required this.sender,
    required this.message,
    required this.isUser,
    required this.showAdditinalInfo
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
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
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
                        padding: const EdgeInsets.only(bottom: 1, right: 10),
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
                        padding: const EdgeInsets.only(bottom: 1),
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

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

