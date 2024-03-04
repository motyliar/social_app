import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:flutter/material.dart';

TextEditingController _subject = TextEditingController();
TextEditingController _content = TextEditingController();

class Message extends StatelessWidget {
  final MessageEntity? message;
  const Message({this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Send New Message')),
            const SizedBox(
              height: 50,
            ),
            Form(
                child: Column(
              children: [
                const Row(
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
                    const Text('Subject'),
                    SizedBox(
                      width: 200,
                      child: TextFormField(
                        controller: _subject,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _content,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Send'),
                ),
              ],
            ))
          ],
        ),
      )),
    );
  }
}
