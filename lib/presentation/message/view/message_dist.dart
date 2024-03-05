import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:climbapp/presentation/message/view/message_main.dart';
import 'package:climbapp/presentation/message/view/subview/create_new_message.dart';
import 'package:climbapp/presentation/message/view/subview/message_reply.dart';
import 'package:flutter/material.dart';

const String _directionReceived = 'received';
const String _directionSend = 'send';

class MessageDistributor extends StatelessWidget {
  const MessageDistributor({super.key});

  static Route route() => MaterialPageRoute(
      settings: const RouteSettings(name: routeMessagePage),
      builder: (_) => const MessageDistributor());

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<MessageViewCubit, MessageViewState>(
          builder: (context, viewState) {
        if (viewState is MessageViewInitial) {
          return const MessageMain(direction: _directionReceived);
        }
        if (viewState is MessageViewSend) {
          return MessageMain(
            direction: _directionSend,
            key: UniqueKey(),
          );
        }
        if (viewState is MessageViewNewMessage) {
          return const CreateNewMessage();
        }
        if (viewState is MessageViewMessage) {
          return MessagePreview(
            message: viewState.message,
          );
        }
        if (viewState is MessageViewReply) {
          return MessageReply(message: viewState.message);
        } else {
          return MessageMain(
            direction: _directionReceived,
            key: UniqueKey(),
          );
        }
      });
}
