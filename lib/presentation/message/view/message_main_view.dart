import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:climbapp/presentation/message/view/message_preview.dart';
import 'package:climbapp/presentation/message/view/subview/message_reply.dart';
import 'package:climbapp/presentation/message/widgets/navigation_state.dart';
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
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const LitlleTopBar(
                bottomMargin: 0,
              ),
              const NavigationState(
                direction: '',
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.7,
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
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: BlocBuilder<MessageViewCubit, MessageViewState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: FloatingActionButton(
                  tooltip: 'Create new message',
                  onPressed: () => BlocProvider.of<MessageViewCubit>(context)
                      .changeView(MessageView.create),
                  backgroundColor: ColorPallete.greyShadowColorOpacityMax,
                  child: const Icon(
                    Icons.add,
                    color: ColorPallete.pinkDecorationColor,
                  )),
            );
          },
        ),
      ),
    );
  }
}
