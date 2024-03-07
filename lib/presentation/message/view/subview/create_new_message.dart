import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/app/widgets/loading_state.dart';
import 'package:climbapp/presentation/friends/business/bloc/friends_action_bloc.dart';
import 'package:climbapp/presentation/friends/widgets/widgets.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:climbapp/presentation/message/business/cubit/recipient/recipient_cubit.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:climbapp/presentation/message/business/logic/message_logic.dart';
import 'package:climbapp/presentation/message/widgets/widgets.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/widgets/user_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

// todo refactoring do zrobienia dwie strony nowa wiadomosc i odpopowiedz na wiadomosci
// jak to skonczymy zostały detale w innych działach i można przesyłac
// todo po wysłaniu wiadomości przejście do home i wyczyszczenie wszystkich contextów
TextEditingController userController = TextEditingController();

@immutable
class CreateNewMessage extends StatelessWidget {
  CreateNewMessage({super.key, this.message, this.friend});
  static Route route({required FriendsEntity friend}) => MaterialPageRoute(
        settings: const RouteSettings(name: routeCreateMessage),
        builder: (_) => CreateNewMessage(
          friend: friend,
        ),
      );
  final FriendsEntity? friend;
  final MessageEntity? message;
  late TextEditingController contentController = TextEditingController(
      text: message != null
          ? MessageLogic.createReMessageTemplate(message!)
          : '');
  late TextEditingController subjectController = TextEditingController(
      text: message != null ? 'FWD: ${message!.subject}' : '');

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return BlocProvider(
      create: (context) => RecipientCubit()
        ..addRecipient(message != null
            ? recipientFromMessage(message!)
            : friend != null
                ? friend!
                : const FriendsEntity(
                    id: '',
                    userName: '',
                    profileAvatar: '',
                    isActive: false,
                    lastLoggedIn: '')),
      child: Scaffold(
        backgroundColor: ColorPallete.scaffoldBackground,
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            CustomSliverAppBar(
              direction: '',
              user: user,
              messages: const [],
              children: [
                BlocBuilder<MessageViewCubit, MessageViewState>(
                  builder: (context, state) {
                    return const NavigationState(
                      direction: '',
                      thirdText: 'Create',
                      isThird: true,
                    );
                  },
                )
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: kGeneralPagesMargin),
                child: Form(
                  child: UserViewCard(children: [
                    BlocBuilder<RecipientCubit, RecipientState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const HeadersSmallText(text: 'To:'),
                                const Gap(kMidEmptySpace),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.40,
                                  child: Text(
                                    state.recipient?.userName == ''
                                        ? 'Choose recipient'
                                        : state.recipient!.userName,
                                    style: state.recipient?.userName != ''
                                        ? AppTextStyle.headersSmall.copyWith(
                                            fontWeight: FontWeight.bold)
                                        : AppTextStyle.descriptionMid,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () async {
                                FriendsEntity? friends =
                                    await getRecipient(context, user);
                                if (friends != null) {
                                  // ignore: use_build_context_synchronously
                                  context
                                      .read<RecipientCubit>()
                                      .addRecipient(friends);
                                }
                              },
                              child: const CircleAvatar(
                                radius: 25,
                                backgroundColor:
                                    ColorPallete.mainDecorationColor,
                                child: Icon(
                                  Icons.contacts,
                                  color: ColorPallete.pinkDecorationColor,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const GradientDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextFormField(
                            style: AppTextStyle.headersSmall,
                            maxLines: 1,
                            maxLength: 200,
                            controller: subjectController,
                            decoration: const InputDecoration(
                              hintText: 'subject',
                              hintStyle: AppTextStyle.descriptionMid,
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(kMinEmptySpace),
                    Container(
                      padding: const EdgeInsets.all(kMidEmptySpace),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorPallete.pinkDecorationColor),
                          borderRadius:
                              BorderRadius.circular(kMinBorderRadius)),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextFormField(
                        style: AppTextStyle.headersSmall,
                        minLines: 10,
                        maxLines: 1000,
                        controller: contentController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Divider(),
                    BlocBuilder<RecipientCubit, RecipientState>(
                      builder: (context, state) {
                        return MidTextButton(
                            onTap: () => state.recipient!.userName == ''
                                ? debugPrint('no recipient')
                                : {
                                    context.read<MessageActionBloc>().add(
                                        SendMessageEvent(
                                            params: MessageRequestParams(
                                                url: Uri.parse(
                                                  AppUrl.sendMessageUrl(),
                                                ),
                                                direction: 'send',
                                                singleMessage: SingleMessage(
                                                    to: state.recipient!.id,
                                                    from: user.id,
                                                    sender: user.userName,
                                                    recipient: "Bartek",
                                                    subject:
                                                        subjectController.text,
                                                    content: contentController
                                                        .text)))),
                                    subjectController.clear(),
                                    contentController.clear(),
                                    userController.clear(),
                                  },
                            textLabel: 'Send');
                      },
                    ),
                  ]),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  FriendsEntity recipientFromMessage(MessageEntity message) => FriendsEntity(
      id: message.from,
      userName: message.sender,
      profileAvatar: '',
      isActive: false,
      lastLoggedIn: '');

  Future<FriendsEntity?> getRecipient(
      BuildContext context, UserEntity user) async {
    return showDialog<FriendsEntity>(
        context: context,
        builder: (context) => BlocProvider(
            create: (context) => RecipientCubit(),
            child: BlocBuilder<FriendsActionBloc, FriendsActionState>(
              builder: (context, state) {
                context.read<FriendsActionBloc>().add(FetchFriendsListEvent(
                    params: GetFriendsParams(userId: user.id)));
                if (state is FriendsLoading) {
                  const LoadingPage();
                }
                if (state is FriendsLoaded) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Material(
                        child: Column(
                          children: List.generate(
                              state.friends.length,
                              (index) => SingleUserPreview(
                                      onTap: () async => Navigator.of(context)
                                          .pop(state.friends[index]),
                                      singleUser: state.friends[index],
                                      rightActionIcons: const [
                                        Icon(Icons.forward)
                                      ])),
                        ),
                      ));
                }
                return TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cant find'));
              },
            )));
  }
}
