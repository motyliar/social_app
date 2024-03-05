import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:climbapp/presentation/message/business/cubit/checkbox/message_checkbox_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/delete/message_delete_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:climbapp/presentation/message/business/logic/message_logic.dart';
import 'package:climbapp/presentation/message/view/message_preview.dart';
import 'package:climbapp/presentation/message/view/subview/message_reply.dart';
import 'package:climbapp/presentation/message/widgets/animated_action.dart';
import 'package:climbapp/presentation/message/widgets/delete_actions_buttons.dart';
import 'package:climbapp/presentation/message/widgets/navigation_state.dart';
import 'package:climbapp/presentation/profile/widgets/little_top_bar.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/widgets/user_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

import 'subview/message_subview.dart';

class MessageMain extends StatelessWidget {
  const MessageMain({required this.direction, super.key});

  final String direction;

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc userBloc) => userBloc.state.user);
    String today = DateTime.now().toString().isTooLong(10);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userLocator<MessageActionBloc>()
            ..add(
              LoadUserMessagesEvent(
                params: GetMessageParams(
                  url: AppUrl.getUserMessages(user.id),
                  direction: direction,
                ),
              ),
            ),
        ),
        BlocProvider(
          create: (_) => userLocator<MessageDeleteCubit>(),
        )
      ],
      child: Scaffold(
        backgroundColor: ColorPallete.scaffoldBackground,
        body: BlocBuilder<MessageActionBloc, MessageActionState>(
          builder: (context, messages) {
            BlocProvider.of<MessageCheckboxCubit>(context).addItemsToMap(
                MessageLogic.boolCreator(messages.messages.length));
            if (messages is MessageActionInitial) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: kGeneralPagesMargin, right: kGeneralPagesMargin),
                  child: LinearProgressIndicator(
                    color: ColorPallete.mainDecorationColor,
                    backgroundColor: ColorPallete.pinkDecorationColor,
                    minHeight: 30,
                    borderRadius: BorderRadius.circular(midBorderRadius),
                  ),
                ),
              );
            }
            final listMessages = messages.messages.reversed.toList();
            return SafeArea(
              child: CustomScrollView(slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  expandedHeight: MediaQuery.of(context).size.height * 0.20,
                  floating: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        const LittleAppBar(),
                        Positioned(
                          bottom: 0,
                          left: kGeneralPagesMargin,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              BlocBuilder<MessageDeleteCubit,
                                  MessageDeleteState>(
                                builder: (context, delete) {
                                  return AnimatedAction(
                                      childOne: NavigationState(
                                        direction: direction,
                                      ),
                                      childTwo: DeleteActionButtons(
                                          user: user,
                                          direction: direction,
                                          messages: messages.messages),
                                      condition: delete.messageIds.isEmpty);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => Slidable(
                            startActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    borderRadius: BorderRadius.circular(
                                        kSmallButtonBorderRadius),
                                    onPressed: (context) {},
                                    icon: Icons.message,
                                    backgroundColor:
                                        ColorPallete.mainDecorationColor,
                                    label: 'Send',
                                  )
                                ]),
                            endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    borderRadius: BorderRadius.circular(
                                        kSmallButtonBorderRadius),
                                    backgroundColor: Colors.red,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                    onPressed: (context) => context
                                        .read<MessageDeleteCubit>()
                                        .deleteMessagesFromDB(
                                          deleteParams: MessageDeleteParams(
                                              url:
                                                  AppUrl.deleteMessage(user.id),
                                              direction: direction,
                                              delete: [
                                                messages.messages[index].id
                                              ]),
                                        ),
                                  )
                                ]),
                            child: BlocBuilder<MessageCheckboxCubit,
                                MessageCheckboxState>(
                              builder: (context, isCheck) {
                                return BlocBuilder<MessageViewCubit,
                                    MessageViewState>(
                                  builder: (context, view) {
                                    return GestureDetector(
                                      onTap: () =>
                                          BlocProvider.of<MessageViewCubit>(
                                                  context)
                                              .changeView(MessageView.message,
                                                  message:
                                                      messages.messages[index]),
                                      onLongPress: () {
                                        context
                                            .read<MessageCheckboxCubit>()
                                            .toggleNotfication(index,
                                                isCheck.isCheck ? false : true);
                                        isCheck.checkBoxes[index]['isCheck']
                                            ? context
                                                .read<MessageDeleteCubit>()
                                                .addIdToDelete(
                                                    listMessages[index].id)
                                            : context
                                                .read<MessageDeleteCubit>()
                                                .deleteIdFromList(
                                                    listMessages[index].id);
                                      },
                                      child: UserViewCard(
                                          padding: const EdgeInsets.only(
                                              left: 15, top: 15, bottom: 10),
                                          color: isCheck.checkBoxes[index]
                                                  ['isCheck']
                                              ? Colors.red
                                              : listMessages[index].isRead
                                                  ? ColorPallete.whiteOpacity80
                                                  : ColorPallete
                                                      .mainDecorationColor,
                                          margin: EdgeInsets.only(
                                              top: kMinEmptySpace,
                                              left: kMidEmptySpace,
                                              right: kMidEmptySpace,
                                              bottom: index ==
                                                      listMessages.length - 1
                                                  ? 40
                                                  : 5),
                                          children: [
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 20,
                                                  backgroundImage: NetworkImage(
                                                      listMessages[listMessages
                                                                  .length -
                                                              1]
                                                          .avatars![0]
                                                          .profileAvatar),
                                                ),
                                                const Gap(kMidEmptySpace),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 230,
                                                      child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  listMessages[
                                                                          index]
                                                                      .sender,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(Utils.currentData(
                                                                    today,
                                                                    listMessages[
                                                                            index]
                                                                        .createdAt))
                                                              ],
                                                            )
                                                          ]),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: 200,
                                                          child: Row(
                                                            children: [
                                                              const Text(
                                                                  'Subject:',
                                                                  style: AppTextStyle
                                                                      .descriptionMid),
                                                              const Gap(
                                                                  kMidEmptySpace),
                                                              Expanded(
                                                                child: Text(
                                                                  listMessages[
                                                                          index]
                                                                      .subject,
                                                                  style: AppTextStyle
                                                                      .descriptionMid,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const Gap(
                                                            kMinEmptySpace),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ]),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                      childCount: messages.messages.length),
                )
              ]),
            );
          },
        ),
      ),
    );
  }
}



// appBar: AppBar(
//         title: const Text('App bar'),
//       ),
//       body: BlocBuilder<MessageViewCubit, MessageViewState>(
//           builder: (context, state) {
//         if (state is MessageViewInitial) {
//           return ListOfMessage(
//             direction: _directionReceived,
//             key: UniqueKey(),
//           );
//         }
//         if (state is MessageViewSend) {
//           return ListOfMessage(
//             direction: _directionSend,
//             key: UniqueKey(),
//           );
//         }
//         if (state is MessageViewNewMessage) {
//           return const CreateNewMessage();
//         }
//         if (state is MessageViewMessage) {
//           return MessagePreview(
//             message: state.message,
//           );
//         }
//         if (state is MessageViewReply) {
//           return MessageReply(message: state.message);
//         } else {
//           return ListOfMessage(
//             direction: _directionReceived,
//             key: UniqueKey(),
//           );
//         }
//       }),
