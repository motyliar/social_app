import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/utils/helpers/params.dart';

import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/friends/business/bloc/friends_action_bloc.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double _spaceFromAppBar = 30;
const double _generalPagePadding = 20;

class UserPage extends StatelessWidget {
  const UserPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeUserPage),
      builder: (_) => const UserPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return BlocProvider(
      create: (context) => userLocator<FriendsActionBloc>()
        ..add(FetchFriendsListEvent(params: GetFriendsParams(userId: user.id))),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            return Center(
              child: Column(
                children: [
                  ContainerTemplate(
                    margin: const EdgeInsets.only(
                        left: _generalPagePadding, right: _generalPagePadding),
                    padding: const EdgeInsets.only(
                      bottom: _generalPagePadding,
                    ),
                    borderRadius: kMinBorderRadius,
                    color: ColorPallete.whiteOpacity80,
                    width: MediaQuery.of(context).size.width,
                    child: const Column(
                      children: [
                        MidTextButton(
                            buttonWidth: 300, textLabel: 'Edit Profile'),
                      ],
                    ),
                  ),
                  const GradientDivider(
                    dividerHeight: 15,
                  ),
                  ContainerTemplate(
                    margin: const EdgeInsets.only(
                        left: _generalPagePadding, right: _generalPagePadding),
                    padding: const EdgeInsets.all(_generalPagePadding),
                    borderRadius: kMinBorderRadius,
                    width: MediaQuery.of(context).size.width,
                    color: ColorPallete.whiteOpacity80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'General Information',
                          style: AppTextStyle.headersSmall,
                        ),
                        const Divider(),
                        InformationRowWidget(
                          icon: Icons.person,
                          title: 'Name: ',
                          details: state.user.userName,
                        ),
                        InformationRowWidget(
                            icon: Icons.email,
                            title: 'Email: ',
                            details: state.user.userEmail),
                        InformationRowWidget(
                            icon: Icons.calendar_month,
                            title: 'Age: ',
                            details: state.user.details?.age == null
                                ? ' not specified'
                                : state.user.details!.age.toString()),
                        const InformationRowWidget(
                            icon: Icons.location_city,
                            title: 'From: ',
                            details: 'Poznan'),
                        const InformationRowWidget(
                            icon: Icons.military_tech,
                            iconColor: ColorPallete.gold,
                            title: 'Rank : ',
                            details: '4.8')
                      ],
                    ),
                  ),
                  const GradientDivider(
                    dividerHeight: 15,
                  ),
                  ContainerTemplate(
                    margin: const EdgeInsets.only(
                        left: _generalPagePadding, right: _generalPagePadding),
                    width: MediaQuery.of(context).size.width -
                        (2 * _generalPagePadding),
                    borderRadius: kMinBorderRadius,
                    padding: const EdgeInsets.all(_generalPagePadding),
                    color: ColorPallete.whiteOpacity80,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Friends',
                            style: AppTextStyle.headersSmall,
                          ),
                          Row(
                            children: [
                              Text(
                                'You have ${context.select((FriendsActionBloc bloc) => bloc.state.friends.length)} friends',
                                style: AppTextStyle.descriptionSmall,
                              ),
                            ],
                          ),
                          const Divider(),
                          BlocBuilder<FriendsActionBloc, FriendsActionState>(
                            builder: (context, state) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 120,
                                child: GridView.count(
                                    crossAxisCount: 3,
                                    childAspectRatio: 0.8,
                                    children: List.generate(
                                        3,
                                        (index) => Container(
                                            width: 70,
                                            height: 120,
                                            margin: const EdgeInsets.all(5),
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: state.friends.length <
                                                    index + 1
                                                ? Text('')
                                                : Column(children: [
                                                    Stack(children: [
                                                      CircleAvatar(
                                                        radius: 40,
                                                        backgroundImage:
                                                            NetworkImage(state
                                                                .friends[index]
                                                                .profileAvatar),
                                                      ),
                                                      Positioned(
                                                        bottom: 0,
                                                        right: 0,
                                                        child: Container(
                                                          width: 15,
                                                          height: 15,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              color: state
                                                                      .friends[
                                                                          index]
                                                                      .isActive
                                                                  ? Colors.green
                                                                  : Colors
                                                                      .grey),
                                                        ),
                                                      ),
                                                    ]),
                                                    Text(state.friends[index]
                                                        .userName)
                                                  ])))),
                              );
                            },
                          ),
                          Divider(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'check more...',
                              style: AppTextStyle.descriptionMid,
                            ),
                          ),
                        ]),
                  )
                ],
              ),
            );
          } else {
            return const Text('error');
          }
        },
      ),
    );
  }
}

class InformationRowWidget extends StatelessWidget {
  const InformationRowWidget({
    required this.icon,
    required this.title,
    required this.details,
    this.iconColor = ColorPallete.mainDecorationColor,
    super.key,
  });
  final IconData icon;
  final String title;
  final String details;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          Text(title),
          Text(
            details,
            style: AppTextStyle.descriptionMid,
          ),
        ],
      ),
    );
  }
}



// child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ElevatedButton(
//                             onPressed: () {
//                               context
//                                   .read<ViewSwitchCubit>()
//                                   .changeStatus(ViewStatus.settings);
//                             },
//                             child: Text('ACCOUNT SETTINGS')),
//                         ElevatedButton(
//                             onPressed: () {
//                               context
//                                   .read<ViewSwitchCubit>()
//                                   .changeStatus(ViewStatus.info);
//                             },
//                             child: Text('INFO')),
//                         ElevatedButton(
//                             onPressed: () {
//                               context
//                                   .read<ViewSwitchCubit>()
//                                   .changeStatus(ViewStatus.sport);
//                             },
//                             child: Text('MY SPORTS')),
//                         ElevatedButton(
//                             onPressed: () {
//                               context
//                                   .read<ViewSwitchCubit>()
//                                   .changeStatus(ViewStatus.notice);
//                             },
//                             child: Text('MY NOTICE')),
