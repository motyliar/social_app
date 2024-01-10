import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController _subject = TextEditingController();
TextEditingController _content = TextEditingController();

class CreateNewMessage extends StatelessWidget {
  const CreateNewMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text('Send New Message')),
            SizedBox(
              height: 50,
            ),
            BlocBuilder<MessageActionBloc, MessageActionState>(
              builder: (context, state) {
                return Form(
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
                      onPressed: () {
                        context.read<MessageActionBloc>().add(SendMessageEvent(
                            params: MessageRequestParams(
                                url: Uri.parse(
                                  AppUrl.sendMessageUrl(),
                                ),
                                direction: 'send',
                                singleMessage: SingleMessage(
                                    to: "658c32bbcc61d05e51becd38",
                                    from: user.id,
                                    sender: user.userName,
                                    recipient: "Bartek",
                                    subject: _subject.text,
                                    content: _content.text))));
                        ;
                      },
                      child: Text('Send'),
                    ),
                  ],
                ));
              },
            )
          ],
        ),
      )),
    );
  }
}
