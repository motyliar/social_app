import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/message_view.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/core/utils/helpers/lorem_ipsum.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';

import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/profile/business/cubit/add_to_friend/add_to_friend_cubit.dart';
import 'package:climbapp/presentation/profile/business/cubit/fetch_user/fetch_user_profile_cubit.dart';

import 'package:climbapp/presentation/profile/widgets/widgets.dart';
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

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userLocator<FetchUserProfileCubit>()
            ..getUserDetails(GetUserParams(token: '0000', userId: user.id)),
        ),
        BlocProvider(
          create: (context) => userLocator<AddToFriendCubit>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorPallete.scaffoldBackground,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              const LitlleTopBar(),
              BlocBuilder<FetchUserProfileCubit, FetchUserProfileState>(
                builder: (context, state) {
                  if (state is FetchUserProfileLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is FetchUserProfileLoaded) {
                    return GeneralCard(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StatusUserAvatar(
                            isActive: state.user.active.isActive,
                            avatar: user.profileAvatar,
                          ),
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
              GeneralCard(children: [
                BlocConsumer<AddToFriendCubit, AddToFriendState>(
                  listener: (context, state) {
                    if (state.status == FriendStatus.add) {
                      appUser.user.friends.add(user.id);
                    }
                    if (state.status == FriendStatus.delete) {
                      appUser.user.friends.remove(user.id);
                    }
                  },
                  builder: (context, state) {
                    return BlocBuilder<FetchUserProfileCubit,
                        FetchUserProfileState>(builder: (context, state) {
                      if (state is FetchUserProfileLoaded) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BlocBuilder<FetchUserProfileCubit,
                                FetchUserProfileState>(
                              builder: (context, state) {
                                if (state is FetchUserProfileLoaded) {
                                  return MidTextButton(
                                    onTap: () => Navigator.pushNamed(
                                        context, routeMessagePage,
                                        arguments: MessageViewParams(
                                            view: MessageView.other,
                                            friend:
                                                convertToFriend(state.user))),
                                    margin:
                                        const EdgeInsets.all(kMinEmptySpace),
                                    borderRadius: kSmallButtonBorderRadius,
                                    textLabel: 'Send message',
                                    textStyle: AppTextStyle.descriptionMid,
                                  );
                                }
                                return const Text('no data');
                              },
                            ),
                            BlocBuilder<AddToFriendCubit, AddToFriendState>(
                              buildWhen: (previous, current) =>
                                  previous.status != current.status,
                              builder: (context, state) {
                                return MidTextButton(
                                  onTap: () {
                                    !isMyFriend(appUser.user.friends, user.id)
                                        ? BlocProvider.of<AddToFriendCubit>(
                                                context)
                                            .addToFriend(
                                            GetFriendsParams(
                                              userId: appUser.user.id,
                                              friendId: user.id,
                                            ),
                                          )
                                        : BlocProvider.of<AddToFriendCubit>(
                                                context)
                                            .deleteFromFriends(
                                            GetFriendsParams(
                                              userId: appUser.user.id,
                                              friendId: user.id,
                                            ),
                                          );
                                  },
                                  borderRadius: kSmallButtonBorderRadius,
                                  margin: const EdgeInsets.all(kMinEmptySpace),
                                  textLabel:
                                      isMyFriend(appUser.user.friends, user.id)
                                          ? 'Remove friends'
                                          : 'Add to friends',
                                  textStyle: AppTextStyle.descriptionMid,
                                );
                              },
                            ),
                          ],
                        );
                      }
                      return const Text('something wrong');
                    });
                  },
                )
              ]),
              const GradientDivider(
                dividerHeight: kMidDividerHeight,
              ),
              GeneralCard(
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
              const GeneralCard(children: [
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

FriendsEntity convertToFriend(UserEntity user) => FriendsEntity(
    id: user.id,
    userName: user.userName,
    profileAvatar: '',
    isActive: user.active.isActive,
    lastLoggedIn: user.active.lastLoggedIn);

bool isMyFriend(List<String> userFriends, String profileID) {
  for (String id in userFriends) {
    if (id == profileID) {
      return true;
    }
  }
  return false;
}
