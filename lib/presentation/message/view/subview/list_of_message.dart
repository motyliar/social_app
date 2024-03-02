import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:climbapp/presentation/message/business/cubit/checkbox/message_checkbox_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/delete/message_delete_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:climbapp/presentation/message/widgets/checkbox.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/widgets/user_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

bool isChecked = true;

class ListOfMessage extends StatelessWidget {
  final String direction;
  const ListOfMessage({required this.direction, super.key});

  @override
  Widget build(BuildContext context) {
    print(direction);
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => userLocator<MessageActionBloc>()
            ..add(LoadUserMessagesEvent(
                params: GetMessageParams(
                    direction: direction,
                    url: AppUrl.getUserMessages(user.id)))),
        ),
        BlocProvider(create: (context) => userLocator<MessageDeleteCubit>())
      ],
      child: Scaffold(body: BlocBuilder<MessageActionBloc, MessageActionState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                children: [
                  Text('ACTION'),
                  BlocBuilder<MessageDeleteCubit, MessageDeleteState>(
                    builder: (context, state) {
                      return IconButton(
                          onPressed: () {
                            context
                                .read<MessageDeleteCubit>()
                                .deleteMessagesFromDB(
                                  deleteParams: MessageDeleteParams(
                                      url: AppUrl.deleteMessage(user.id),
                                      direction: direction,
                                      delete: state.messageIds),
                                );
                            Future.delayed(
                                Duration(seconds: 1),
                                () => BlocProvider.of<MessageActionBloc>(
                                        context)
                                    .add(LoadUserMessagesEvent(
                                        params: GetMessageParams(
                                            url:
                                                AppUrl.getUserMessages(user.id),
                                            direction: direction))));
                          },
                          icon: Icon(
                            Icons.delete,
                            color: state.messageIds.length == 0
                                ? Colors.grey
                                : Colors.red,
                          ));
                    },
                  ),
                  // IconButton(
                  //   onPressed: () {
                  //     showDialog(
                  //         barrierColor: Colors.transparent,
                  //         context: context,
                  //         builder: (BuildContext context) {
                  //           return Stack(children: [
                  //             Positioned(
                  //                 child: Container(
                  //               color: Colors.transparent,
                  //               height: MediaQuery.of(context).size.height,
                  //             )),
                  //             Positioned(
                  //               top: 100,
                  //               child: AlertDialog(
                  //                 backgroundColor: Colors.transparent,
                  //                 elevation: 0,
                  //                 content: SizedBox(
                  //                   width: 30,
                  //                   height: 40,
                  //                   child: Center(
                  //                     child: LinearProgressIndicator(
                  //                         color: Colors.grey.withOpacity(0.5)),
                  //                   ),
                  //                 ),
                  //               ),
                  //             )
                  //           ]);
                  //         });
                  //     Future.delayed(
                  //         Duration(seconds: 1),
                  //         () => context.read<MessageActionBloc>().add(
                  //               LoadUserMessagesEvent(
                  //                   params: GetMessageParams(
                  //                       url: AppUrl.getUserMessages(user.id),
                  //                       direction: direction)),
                  //             )).whenComplete(
                  //         () => Navigator.of(context).pop());
                  //   },
                  //   icon: Icon(Icons.refresh),
                  // ),
                ],
              ),
              Column(
                children: List.generate(
                  state.messages.length,
                  (index) => UserViewCard(
                      color: state.messages[index].isRead
                          ? ColorPallete.whiteOpacity80
                          : ColorPallete.mainDecorationColor,
                      margin: const EdgeInsets.only(top: kMinEmptySpace),
                      children: [
                        Row(
                          children: [
                            Text(
                              'From:',
                              style: AppTextStyle.descriptionMid,
                            ),
                            Gap(kMidEmptySpace),
                            Text(state.messages[index].sender,
                                style: AppTextStyle.descriptionMid),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('Subject:',
                                    style: AppTextStyle.descriptionMid),
                                Gap(kMidEmptySpace),
                                Text(state.messages[index].subject,
                                    style: AppTextStyle.descriptionMid),
                              ],
                            ),
                            BlocBuilder<MessageCheckboxCubit,
                                MessageCheckboxState>(
                              builder: (context, messagesState) {
                                final _messagesList = state.messages;
                                return CheckBoxWidgets(
                                    onTap: () {
                                      context
                                          .read<MessageCheckboxCubit>()
                                          .toggleNotfication(
                                              index,
                                              messagesState.isCheck
                                                  ? false
                                                  : true);

                                      messagesState.checkBoxes[index]['isCheck']
                                          ? context
                                              .read<MessageDeleteCubit>()
                                              .addIdToDelete(
                                                  _messagesList[index].id)
                                          : context
                                              .read<MessageDeleteCubit>()
                                              .deleteIdFromList(
                                                  _messagesList[index].id);
                                    },
                                    isCheck: messagesState.checkBoxes[index]
                                        ['isCheck']);
                              },
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: Utils.sizeCalculator(
                    totalDimension: 50,
                    multipler: state.messages.length.toDouble()),
                child: ListView.builder(
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      BlocProvider.of<MessageCheckboxCubit>(context)
                          .addItemsToMap(boolCreator(state.messages.length));
                      final _messagesList = state.messages;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<MessageViewCubit>(context)
                                  .changeView(MessageView.message,
                                      message: state.messages[index]);

                              context
                                  .read<MessageActionBloc>()
                                  .add(UpdateMessageEvent(
                                      params: MessageUpdateParams<bool>(
                                    url: AppUrl.updateMessage(user.id),
                                    direction: direction,
                                    update: true,
                                    field: "isRead",
                                    messageId: state.messages[index].id,
                                  )));

                              print(
                                  '//${user.id}  ${state.messages[index].id}');
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('From: ${state.messages[index].sender}'),
                                Text(
                                  'Subject: ' + state.messages[index].subject,
                                  style: TextStyle(
                                      fontWeight: state.messages[index].isRead
                                          ? FontWeight.normal
                                          : FontWeight.bold),
                                ),
                                Divider(),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ],
          );
        },
      )),
    );
  }
}

List<Map> boolCreator(int index) {
  List<Map> newList = [];
  for (var i = 0; i < index; i++) {
    newList.add({"name": i, "isCheck": false});
  }
  return newList;
}
