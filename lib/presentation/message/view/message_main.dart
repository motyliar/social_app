import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:climbapp/presentation/message/business/cubit/checkbox/message_checkbox_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/delete/message_delete_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:climbapp/presentation/message/business/logic/message_logic.dart';
import 'package:climbapp/presentation/message/widgets/widgets.dart';
import 'package:climbapp/presentation/profile/widgets/little_top_bar.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/widgets/user_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

class MessageMain extends StatelessWidget {
  const MessageMain({required this.direction, super.key});

  final String direction;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
                                    label: l10n.sendPageTop,
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
                                    label: l10n.deleteButton,
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
                                      onTap: () => {
                                        BlocProvider.of<MessageViewCubit>(
                                                context)
                                            .changeView(MessageView.message,
                                                message:
                                                    messages.messages[index]),
                                        context.read<MessageActionBloc>().add(
                                              UpdateMessageEvent(
                                                params:
                                                    MessageUpdateParams<bool>(
                                                  direction: direction,
                                                  url: AppUrl.updateMessage(
                                                      user.id),
                                                  update: true,
                                                  field: 'isRead',
                                                  messageId:
                                                      listMessages[index].id,
                                                ),
                                              ),
                                            ),
                                      },
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
                                      child: SingleMessageTile(
                                          avatar: AnimatedAvatar(
                                            isRead: isCheck.checkBoxes[index]
                                                ['isCheck'],
                                            avatarImage: listMessages[
                                                    listMessages.length - 1]
                                                .avatars![0]
                                                .profileAvatar,
                                          ),
                                          description: MessageDescriptions(
                                              message: listMessages[index],
                                              today: today),
                                          isSelected: isCheck.checkBoxes[index]
                                              ['isCheck'],
                                          isRead: listMessages[index].isRead,
                                          today: today),
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
