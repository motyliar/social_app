import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/presentation/message/business/cubit/cubit/message_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view/subview/message_subview.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';

const String _directionReceived = 'received';
const String _directionSend = 'send';

class MessageMainView extends StatelessWidget {
  const MessageMainView({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeMessagePage),
        builder: (_) => MessageMainView());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessageViewCubit(),
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back)),
                  Text('Your Messanger'),
                ],
              ),
              BlocBuilder<MessageViewCubit, MessageViewState>(
                builder: (context, state) {
                  return Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<MessageViewCubit>()
                                  .changeView(MessageView.received);
                            },
                            child: Text('Received')),
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<MessageViewCubit>()
                                  .changeView(MessageView.send);
                            },
                            child: Text('Send')),
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<MessageViewCubit>()
                                  .changeView(MessageView.received);
                            },
                            child: Text('Trash')),
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<MessageViewCubit>()
                                  .changeView(MessageView.create);
                            },
                            child: Text('New')),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.6,
                child: BlocBuilder<MessageViewCubit, MessageViewState>(
                    builder: (context, state) {
                  if (state is MessageViewInitial) {
                    return ListOfMessage(
                      direction: _directionReceived,
                      key: UniqueKey(),
                    );
                  }
                  if (state is MessageViewSend) {
                    return ListOfMessage(
                      direction: _directionSend,
                      key: UniqueKey(),
                    );
                  }
                  if (state is MessageViewNewMessage) {
                    return CreateNewMessage();
                  }
                  if (state is MessageViewMessage) {
                    return Message();
                  } else {
                    return ListOfMessage(
                      direction: _directionReceived,
                      key: UniqueKey(),
                    );
                  }
                }),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
