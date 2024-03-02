import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:climbapp/presentation/message/view/message_preview.dart';
import 'package:climbapp/presentation/message/view/subview/message_reply.dart';
import 'package:climbapp/presentation/profile/widgets/widgets.dart';
import 'package:climbapp/presentation/user/widgets/user_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../view/subview/message_subview.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';

const String _directionReceived = 'received';
const String _directionSend = 'send';

class MessageMainView extends StatelessWidget {
  const MessageMainView({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeMessagePage),
        builder: (_) => const MessageMainView());
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
              const LitlleTopBar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MidTextButton(
                    textLabel: 'Received',
                    borderRadius: kSmallButtonBorderRadius,
                  ),
                  MidTextButton(
                    textLabel: 'Send',
                    borderRadius: kSmallButtonBorderRadius,
                  ),
                  MidTextButton(
                    textLabel: 'Thrash',
                    borderRadius: kSmallButtonBorderRadius,
                  ),
                ],
              ),
              Gap(kGeneralPagesMargin),
              UserViewCard(children: [
                GradientDivider(),
              ]),
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
                            child: const Text('Received')),
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<MessageViewCubit>()
                                  .changeView(MessageView.send);
                            },
                            child: const Text('Send')),
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<MessageViewCubit>()
                                  .changeView(MessageView.received);
                            },
                            child: const Text('Trash')),
                        ElevatedButton(
                            onPressed: () {
                              context
                                  .read<MessageViewCubit>()
                                  .changeView(MessageView.create);
                            },
                            child: const Text('New')),
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
                    return const CreateNewMessage();
                  }
                  if (state is MessageViewMessage) {
                    return MessagePreview(
                      message: state.message,
                    );
                  }
                  if (state is MessageViewReply) {
                    return MessageReply(message: state.message);
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
