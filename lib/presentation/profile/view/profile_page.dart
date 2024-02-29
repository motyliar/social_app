import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/core/utils/helpers/lorem_ipsum.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/button_icon.dart';

import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/profile/business/fetch_user/fetch_user_profile_cubit.dart';
import 'package:climbapp/presentation/profile/widgets/description_column.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';

// wejśc teraz w profile page i ustawić innego użytkownika który nie jest zalogowany

class ProfilePage extends StatelessWidget {
  const ProfilePage({required this.user, super.key});
  static Route<dynamic> route({required FriendsEntity user}) {
    return MaterialPageRoute(
      settings: const RouteSettings(
        name: routeProfilePage,
      ),
      builder: (_) => ProfilePage(
        user: user,
      ),
    );
  }

  final FriendsEntity user;

  @override
  Widget build(BuildContext context) {
    String today = DateTime.now().toString().isTooLong(10);
    final appUser = context.select((UserBloc bloc) => bloc.state);

    return BlocProvider(
      create: (context) => userLocator<FetchUserProfileCubit>()
        ..getUserDetails(GetUserParams(token: '0000', userId: user.id)),
      child: Scaffold(
        backgroundColor: ColorPallete.scaffoldBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              GradientDivider(
                dividerHeight: 70,
                topMargin: 0,
                bottomMargin: kGeneralPagesMargin,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(midBorderRadius),
                    bottomRight: Radius.circular(midBorderRadius)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: kMinEmptySpace,
                      right: kGeneralPagesMargin,
                      left: kGeneralPagesMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundBackButton(
                        onTap: () => Navigator.of(context).pop(),
                      ),
                      ButtonIcon(
                          onTap: () =>
                              Navigator.popAndPushNamed(context, routeUserMain),
                          child: AppIcons.personIcon.copyWith(
                              size: 30,
                              color: ColorPallete.pinkDecorationColor)),
                    ],
                  ),
                ),
              ),
              BlocBuilder<FetchUserProfileCubit, FetchUserProfileState>(
                builder: (context, state) {
                  if (state is FetchUserProfileLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is FetchUserProfileLoaded) {
                    print(state.user.active.lastLoggedIn);
                    return UserViewCard(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(user.profileAvatar),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 10,
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: state.user.active.isActive
                                      ? ColorPallete.greenActiveColor
                                      : ColorPallete.greyShadowColorOpacityMax,
                                ))
                          ]),
                          Column(
                            children: [
                              const GradientDivider(
                                width: 100,
                              ),
                              Row(
                                children: [
                                  const DescriptionColumn(elements: 7, texts: [
                                    'Name:',
                                    'E-mail: ',
                                    'From: ',
                                    'Age: ',
                                    'Phone: ',
                                    'Last seen: ',
                                    'Gender: ',
                                  ]),
                                  DescriptionColumn(elements: 7, texts: [
                                    state.user.userName.capitalize(),
                                    state.user.userEmail,
                                    'Poznan',
                                    state.user.details?.age.toString() ??
                                        'not specified',
                                    state.user.details?.phone ??
                                        'not specified',
                                    Utils.currentData(
                                        today, state.user.active.lastLoggedIn),
                                    state.user.details?.gender ??
                                        'not specified'
                                  ]),
                                ],
                              ),
                              LayoutBuilder(builder: ((context, constraints) {
                                print(constraints.maxWidth);
                                return Container();
                              })),
                              const GradientDivider(
                                gradient: pinkToBlueRoundGradient,
                                width: 100,
                              ),
                            ],
                          ),
                        ],
                      )
                    ]);
                  }
                  return const Text('Error');
                },
              ),
              const GradientDivider(
                dividerHeight: kMidDividerHeight,
              ),
              UserViewCard(children: [
                BlocBuilder<FetchUserProfileCubit, FetchUserProfileState>(
                    builder: (context, state) {
                  if (state is FetchUserProfileLoaded) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const MidTextButton(
                          margin: EdgeInsets.all(kMinEmptySpace),
                          borderRadius: kSmallButtonBorderRadius,
                          textLabel: 'Send message',
                          textStyle: AppTextStyle.headersSmall,
                        ),
                        MidTextButton(
                          borderRadius: kSmallButtonBorderRadius,
                          margin: const EdgeInsets.all(kMinEmptySpace),
                          textLabel:
                              isMyFriend(appUser.user.friends, state.user.id)
                                  ? 'Remove from friends'
                                  : 'Add to friends',
                          textStyle: AppTextStyle.headersSmall,
                        ),
                      ],
                    );
                  }
                  return const Text('something wrong');
                })
              ]),
              const GradientDivider(
                dividerHeight: kMidDividerHeight,
              ),
              UserViewCard(
                children: [
                  const Text(
                    'Sport rate',
                    style: AppTextStyle.headersSmall,
                  ),
                  const Divider(),
                  const Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 219, 199, 16),
                      ),
                      SizedBox(
                        width: kMinEmptySpace,
                      ),
                      Text(
                        '4.3',
                        style: AppTextStyle.headersSmall,
                      ),
                    ],
                  ),
                  const GradientDivider(),
                  const Text(
                    'Favourite sports and skill',
                    style: AppTextStyle.headersSmall,
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('climbing'),
                      Row(
                        children: List.generate(
                          3,
                          (index) => AppIcons.star,
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('padel'),
                        Row(
                          children: List.generate(
                            4,
                            (index) => AppIcons.star,
                          ),
                        ),
                      ]),
                  const GradientDivider(),
                  const Text(
                    'Recomendations : (10) ',
                    style: AppTextStyle.headersSmall,
                  ),
                  const Divider(),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(4, (index) => AppIcons.star),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'From: Marcin',
                            style: AppTextStyle.descriptionMid,
                          ),
                          HeadersSmallText(text: 'climbing')
                        ],
                      ),
                      const GradientDivider(
                        width: 100,
                      ),
                      Text(loremIpsumMid.isTooLong(150)),
                      const Divider(),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: MidTextButton(
                          borderRadius: kSmallButtonBorderRadius,
                          textLabel: 'more...',
                          buttonWidth: 90,
                          buttonHeight: 30,
                          textStyle: AppTextStyle.descriptionMid,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const GradientDivider(
                dividerHeight: kMidDividerHeight,
              ),
              const UserViewCard(children: [
                HeadersSmallText(text: 'Activity'),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Notice title'),
                    Text('notice category'),
                  ],
                )
              ])
            ]),
          ),
        ),
      ),
    );
  }
}

bool isMyFriend(List<String> userFriends, String profileID) {
  for (String id in userFriends) {
    if (id == profileID) {
      return true;
    }
  }
  return false;
}
