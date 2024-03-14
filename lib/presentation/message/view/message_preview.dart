import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/message/business/cubit/delete/message_delete_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:climbapp/presentation/message/widgets/widgets.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MessagePreview extends StatelessWidget {
  const MessagePreview({required this.message, super.key});
  final MessageEntity message;

  static Route route({
    required MessageEntity message,
  }) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeSingleMessage),
        builder: (_) => MessagePreview(message: message));
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc u) => u.state.user);
    final data = DateTime.now().toString().isTooLong(10);
    return BlocProvider(
      create: (context) => userLocator<MessageDeleteCubit>(),
      child: Scaffold(
        backgroundColor: ColorPallete.scaffoldBackground,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                  direction: '', user: user, messages: [message]),
              SliverToBoxAdapter(
                child: GeneralCard(
                  margin: const EdgeInsets.only(
                      top: kGeneralPagesMargin,
                      left: kGeneralPagesMargin,
                      right: kGeneralPagesMargin),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.yellow,
                            ),
                            const Gap(12),
                            HeadersSmallText(
                                text: message.subject.capitalize()),
                          ],
                        ),
                        Text(
                          Utils.currentData(data, message.createdAt),
                          style: AppTextStyle.descriptionMid,
                        ),
                      ],
                    ),
                    const Divider(),
                    Text('From: ${message.sender}',
                        style: AppTextStyle.descriptionBig),
                    const Divider(),
                    Text(
                      message.content.capitalize(),
                      style: AppTextStyle.descriptionMid,
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppIcons.reply,
                        const Gap(kMidEmptySpace),
                        AppIcons.delete.copyWith(size: 25),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.reply),
          ),
        ),
      ),
    );
  }
}



// SafeArea(
//               child: SingleChildScrollView(
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                   onPressed: () => BlocProvider.of<MessageViewCubit>(context)
//                       .changeView(MessageView.received),
//                   icon: const Icon(Icons.arrow_back)),
//               // TODO Reply to user
//               IconButton(
//                   onPressed: () {
//                     BlocProvider.of<MessageViewCubit>(context)
//                         .changeView(MessageView.reply, message: message);
//                   },
//                   icon: const Icon(Icons.reply)),
//             ],
//           ),
//           const SizedBox(
//             height: 25,
//           ),
//           Text('From: ${message.sender}'),
//           const SizedBox(
//             height: 5,
//           ),
//           RichText(
//             text: TextSpan(
//                 style: const TextStyle(color: Colors.black, fontSize: 15),
//                 children: <TextSpan>[
//                   const TextSpan(
//                       text: 'Subject: ',
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                   TextSpan(text: message.subject),
//                 ]),
//           ),
//           const SizedBox(
//             height: 5,
//           ),
//           Text('Content:\n\n ${message.content}\n'),
//           const SizedBox(
//             height: 5,
//           ),
//           Text('Sent on: ${message.createdAt}'),
//               ]),
//             )),
//         ));
