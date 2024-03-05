import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:climbapp/presentation/message/business/cubit/checkbox/message_checkbox_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/delete/message_delete_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:climbapp/presentation/message/business/logic/message_logic.dart';
import 'package:climbapp/presentation/message/widgets/animated_action.dart';
import 'package:climbapp/presentation/message/widgets/checkbox.dart';
import 'package:climbapp/presentation/message/widgets/delete_actions_buttons.dart';
import 'package:climbapp/presentation/message/widgets/navigation_state.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/widgets/user_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

//todo zrobić boczny panel z wyborem odpowiedniej kategori wiadomości lub zmniejszyć przyciski górne,
// todo : lista wiadomości musi zaczynać się od najnowszych
// dodanie daty do każdej wiadomości aby można było ustalić kiedy wysłane

// zaimplementować przejście do pojedynczej wiadomości wysyłanej bezpośrednio do użytkownika

bool isChecked = true;
ScrollController _pageController = ScrollController();
ScrollController _listController = ScrollController();

class ListOfMessage extends StatelessWidget {
  final String direction;
  const ListOfMessage({required this.direction, super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    String today = DateTime.now().toString().isTooLong(10);
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => userLocator<MessageActionBloc>()
              ..add(LoadUserMessagesEvent(
                  params: GetMessageParams(
                      direction: direction,
                      url: AppUrl.getUserMessages(user.id)))),
          ),
          BlocProvider(create: (context) => userLocator<MessageDeleteCubit>()),
        ],
        child: BlocBuilder<MessageActionBloc, MessageActionState>(
          builder: (context, state) {
            final listMessages = state.messages.reversed.toList();
            BlocProvider.of<MessageCheckboxCubit>(context)
                .addItemsToMap(MessageLogic.boolCreator(state.messages.length));
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocBuilder<MessageDeleteCubit, MessageDeleteState>(
                      builder: (context, delete) {
                        return AnimatedAction(
                            childOne: const NavigationState(),
                            childTwo: DeleteActionButtons(
                                user: user,
                                direction: direction,
                                messages: state.messages),
                            condition: delete.messageIds.isEmpty);
                      },
                    ),
                  ],
                ),
                RefreshIndicator(
                  triggerMode: RefreshIndicatorTriggerMode.anywhere,
                  onRefresh: () async {
                    context.read<MessageActionBloc>().add(LoadUserMessagesEvent(
                        params: GetMessageParams(
                            url: AppUrl.getUserMessages(user.id),
                            direction: direction)));
                    BlocProvider.of<MessageCheckboxCubit>(context)
                        .addItemsToMap(
                            MessageLogic.boolCreator(state.messages.length));
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: ListView(
                      children: List.generate(
                        state.messages.length,
                        (index) => Slidable(
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
                                            url: AppUrl.deleteMessage(user.id),
                                            direction: direction,
                                            delete: [state.messages[index].id]),
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
                                                message: state.messages[index]),
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
                                            bottom:
                                                index == listMessages.length - 1
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
                                                      const Gap(kMinEmptySpace),
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
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
