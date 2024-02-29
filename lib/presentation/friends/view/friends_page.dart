import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/friends/business/bloc/friends_action_bloc.dart';
import 'package:climbapp/presentation/friends/widgets/widgets.dart';
import 'package:climbapp/presentation/profile/view/profile_page.dart';

import 'package:climbapp/presentation/profile/widgets/widgets.dart';
import 'package:climbapp/presentation/sign_in/widgets/text_form_field.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// TODO jeśli search jest puste , nic nie robic
// TODO wyrzucić informację not found
TextEditingController _searchController = TextEditingController();

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeFriendsPage),
      builder: (_) => const FriendsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);

    return BlocProvider(
      create: (context) => userLocator<FriendsActionBloc>()
        ..add(FetchFriendsListEvent(params: GetFriendsParams(userId: user.id))),
      child: Scaffold(
        backgroundColor: ColorPallete.scaffoldBackground,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              LitlleTopBar(),
              UserViewCard(
                children: [
                  HeadersSmallText(text: 'Find someone'),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ContainerTemplate(
                        padding: const EdgeInsets.only(left: kMinEmptySpace),
                        borderRadius: kSmallButtonBorderRadius,
                        color: ColorPallete.whiteOpacity80,
                        gradient: pinkToBlueRoundGradient,
                        width: Utils.sizeCalculator(
                            totalDimension: MediaQuery.of(context).size.width,
                            multipler: 0.5),
                        child: CTextFormField(
                          enableBorders: false,
                          controller: _searchController,
                          hintText: 'find friend',
                        ),
                      ),
                      BlocBuilder<FriendsActionBloc, FriendsActionState>(
                        builder: (context, state) {
                          return MidTextButton(
                              textStyle: AppTextStyle.descriptionSmall,
                              margin: const EdgeInsets.only(left: 5),
                              onTap: () => context
                                  .read<FriendsActionBloc>()
                                  .add(SearchForUsersEvent(
                                      userByName: _searchController.text)),
                              textLabel: 'Search');
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const GradientDivider(
                dividerHeight: kMidDividerHeight,
              ),
              BlocBuilder<FriendsActionBloc, FriendsActionState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () => context
                              .read<FriendsActionBloc>()
                              .add(ChangeStateViewEvent()),
                          child: Text(
                            'My Friends',
                            style: TextStyle(
                                color: state.isMyFriend
                                    ? Colors.red
                                    : Colors.grey),
                          )),
                      ElevatedButton(
                          onPressed: () => context
                              .read<FriendsActionBloc>()
                              .add(ChangeStateViewEvent()),
                          child: Text('Search ppl',
                              style: TextStyle(
                                  color: state.isMyFriend
                                      ? Colors.grey
                                      : Colors.red))),
                    ],
                  );
                },
              ),
              BlocBuilder<FriendsActionBloc, FriendsActionState>(
                  builder: (context, blocstate) {
                if (blocstate is FriendsActionInitial) {
                  return Center(child: CircularProgressIndicator());
                }
                if (blocstate is FriendsSearchingSuccess) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height:
                        _heightCalculate(itemsCount: blocstate.friend.length),
                    child: ListView.builder(
                      itemCount: blocstate.friend.length,
                      itemBuilder: ((context, index) => SingleUserPreview(
                            singleUser: blocstate.friend[index],
                            rightActionIcons: [
                              RightActionIcon(
                                text: 'Send message',
                                icon: AppIcons.messages.copyWith(size: 25),
                                onTap: () {},
                              ),
                              RightActionIcon(
                                  text: isMyFriend(user.friends,
                                          blocstate.friend[index].id)
                                      ? 'Remove friend'
                                      : 'Send request',
                                  icon: isMyFriend(user.friends,
                                          blocstate.friend[index].id)
                                      ? AppIcons.delete.copyWith(size: 25)
                                      : AppIcons.personIcon.copyWith(size: 25),
                                  onTap: () {}),
                            ],
                          )),
                    ),
                  );
                }
                if (blocstate is FriendsLoaded) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: Utils.sizeCalculator(
                          totalDimension: 130,
                          multipler: blocstate.friends.length.toDouble()),
                      child: ListView.builder(
                        itemCount: blocstate.friends.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              SingleUserPreview(
                                singleUser: blocstate.friends[index],
                                rightActionIcons: [
                                  RightActionIcon(
                                    text: 'Send message',
                                    icon: AppIcons.messages.copyWith(size: 25),
                                    onTap: () {},
                                  ),
                                  RightActionIcon(
                                      text: 'Delete friend',
                                      icon: AppIcons.delete.copyWith(size: 25),
                                      onTap: () {})
                                ],
                              ),
                            ],
                          );
                        }),
                      ));
                } else {
                  return Text('null');
                }
              })
            ],
          ),
        )),
      ),
    );
  }
}

class SingleUserPreview extends StatelessWidget {
  const SingleUserPreview({
    required this.singleUser,
    required this.rightActionIcons,
    this.actionIconLeftPadding = 40,
    this.textStyle,
    super.key,
  });
  final FriendsEntity singleUser;
  final List<Widget> rightActionIcons;
  final TextStyle? textStyle;
  final double actionIconLeftPadding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, routeProfilePage, arguments: singleUser),
      child: UserViewCard(
          margin: const EdgeInsets.only(
              top: kMidEmptySpace,
              left: kGeneralPagesMargin,
              right: kGeneralPagesMargin),
          padding: EdgeInsets.only(
              left: kGeneralPagesMargin,
              right: actionIconLeftPadding,
              top: kMinEmptySpace,
              bottom: kMinEmptySpace),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    StatusUserAvatar(
                        radius: kMediumAvatar,
                        activeDotRadius: kDotActiveMedium,
                        dotRightPosition: 0,
                        isActive: singleUser.isActive,
                        avatar: singleUser.profileAvatar),
                    const SizedBox(
                      width: kMidEmptySpace,
                    ),
                    Text(
                      singleUser.userName.capitalize(),
                      style: textStyle ?? AppTextStyle.headersMid,
                    ),
                  ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: rightActionIcons),
              ],
            ),
          ]),
    );
  }
}

double _heightCalculate({required int itemsCount}) {
  return (itemsCount * 100).toDouble();
}
