import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: _contentHeader(context),
    );
  }

  Widget _contentHeader(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top:10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 5, top:17),
              child: Column(
                children: [
                  Image.asset('assets/svg/scorpion_text_logo.png', width: 80, height: 50),
                  Text('')
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red, // Use the specified color
                            offset: Offset(1, 0), // Set X and Y offsets to 0
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 18.0,
                        backgroundImage:
                        AssetImage('assets/svg/1UP_search.webp'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showVideoFullScreenDialog(context);
                      },
                      child:  Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red, // Use the specified colo
                              offset: Offset(1, 0), // Set X and Y offsets to 0
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 18.0,
                          backgroundImage: AssetImage('assets/svg/1UP_AR.webp'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
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
                      child: CircleAvatar(
                        radius: 18.0,
                        backgroundImage:
                        AssetImage('assets/svg/1UP_incoming_messages.webp'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 10, bottom: 4),
                      decoration: BoxDecoration(
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
                      child: CircleAvatar(
                        radius: 22.0,
                        backgroundImage:
                        AssetImage('assets/svg/coin.png'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
                Text(
                  '',
                  style: TextStyle(color: Colors.white38, fontSize: 8),
                )
              ],
            ),
          ],
        ));
  }

  void showVideoFullScreenDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return VideoApp();
      },
    );
  }

}



class VideoApp extends StatefulWidget {
  const VideoApp({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
      _controller = VideoPlayerController.asset('assets/svg/AR.mp4')
      ..addListener(() {})
        ..setLooping(true)
        ..initialize().then((_) {
          _controller.play();
        });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body:  VideoPlayer(_controller),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

