import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:flutter/material.dart';

TextEditingController _subject = TextEditingController();
TextEditingController _content = TextEditingController();

class Message extends StatelessWidget {
  final MessageEntity? message;
  const Message({this.message, super.key});

  @override
  Widget build(BuildContext context) {
    print(message);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Send New Message')),
            SizedBox(
              height: 50,
            ),
            Form(
                child: Column(
              children: [
                Row(
                  children: [
                    Text('Send to:'),
                    SizedBox(
                      width: 30,
                    ),
                    Text('user'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Subject'),
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: _subject,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _content,
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Send'),
                ),
              ],
            ))
          ],
        ),
      )),
    );
  }
}
