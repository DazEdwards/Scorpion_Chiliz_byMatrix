
import 'package:flutter/material.dart';


class BasicService extends StatelessWidget {
  final String serviceName;
  final Widget body;
  const BasicService(
      {
        required this.serviceName,
        required this.body
      }
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFFAC30),
        title: Text(
          serviceName,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            body
          ],
        ),
      ),
    );
  }
}