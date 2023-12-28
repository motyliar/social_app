import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Send New Message')),
          ],
        ),
      )),
    );
  }
}
