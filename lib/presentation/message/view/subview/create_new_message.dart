import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/message/business/bloc/message/message_action_bloc.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
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
TextEditingController subjectController = TextEditingController();

class CreateNewMessage extends StatelessWidget {
  CreateNewMessage({super.key});
  static Route route() => MaterialPageRoute(
        settings: const RouteSettings(name: routeCreateMessage),
        builder: (_) => CreateNewMessage(),
      );

  late TextEditingController contentController =
      TextEditingController(text: 'moj wlasny text');

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return Scaffold(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HeadersSmallText(text: 'To:'),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.40,
                        child: TextFormField(
                          controller: userController,
                          decoration: const InputDecoration(
                              hintStyle: AppTextStyle.descriptionMid,
                              hintText: 'username or e-mail',
                              border: InputBorder.none),
                        ),
                      ),
                      const CircleAvatar(
                        radius: 25,
                        backgroundColor: ColorPallete.mainDecorationColor,
                        child: Icon(
                          Icons.search,
                          color: ColorPallete.pinkDecorationColor,
                        ),
                      ),
                    ],
                  ),
                  const GradientDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HeadersSmallText(text: 'Subject'),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextFormField(
                          maxLines: 1,
                          maxLength: 200,
                          controller: subjectController,
                          decoration: const InputDecoration(
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
                        border:
                            Border.all(color: ColorPallete.pinkDecorationColor),
                        borderRadius: BorderRadius.circular(kMinBorderRadius)),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      minLines: 10,
                      maxLines: 1000,
                      controller: contentController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Divider(),
                  MidTextButton(
                      onTap: () => {
                            context.read<MessageActionBloc>().add(
                                SendMessageEvent(
                                    params: MessageRequestParams(
                                        url: Uri.parse(
                                          AppUrl.sendMessageUrl(),
                                        ),
                                        direction: 'send',
                                        singleMessage: SingleMessage(
                                            to: "65969d8107cb57515ddeb952",
                                            from: user.id,
                                            sender: user.userName,
                                            recipient: "Bartek",
                                            subject: subjectController.text,
                                            content: contentController.text)))),
                            subjectController.clear(),
                            contentController.clear(),
                            userController.clear(),
                          },
                      textLabel: 'Send'),
                ]),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
