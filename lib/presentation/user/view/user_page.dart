import 'package:climbapp/core/constans/export_constans.dart';

import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';

import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';

import 'package:climbapp/presentation/friends/business/bloc/friends_action_bloc.dart';
import 'package:climbapp/presentation/notice/business/cubit/fetch_user_notice/fetch_user_notice_cubit.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/business/cubit/view_switch/view_switch_cubit.dart';
import 'package:climbapp/presentation/user/business/enum.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userLocator<FriendsActionBloc>()
            ..add(FetchFriendsListEvent(
                params: GetFriendsParams(userId: user.id))),
        ),
        BlocProvider(
          create: (context) => userLocator<FetchUserNoticeCubit>()
            ..fetchReturnByState(
                GetNoticeParams(url: AppUrl.fetchUserNoticeURL(user.id))),
        ),
      ],
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            return Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: kMidEmptySpace,
                  ),
                  BlocBuilder<ViewSwitchCubit, ViewSwitchState>(
                    builder: (context, state) {
                      return ContainerTemplate(
                        margin: const EdgeInsets.only(
                            left: _generalPagePadding,
                            right: _generalPagePadding),
                        padding: const EdgeInsets.only(
                          bottom: _generalPagePadding,
                        ),
                        borderRadius: kMinBorderRadius,
                        color: ColorPallete.whiteOpacity80,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            MidTextButton(
                                onTap: () => context
                                    .read<ViewSwitchCubit>()
                                    .changeStatus(ViewStatus.info),
                                buttonWidth: 300,
                                textLabel: 'Edit Profile'),
                          ],
                        ),
                      );
                    },
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
                    padding: const EdgeInsets.only(
                      bottom: _generalPagePadding,
                    ),
                    borderRadius: kMinBorderRadius,
                    color: ColorPallete.whiteOpacity80,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        MidTextButton(
                            onTap: () =>
                                BlocProvider.of<ViewSwitchCubit>(context)
                                    .changeStatus(ViewStatus.sport),
                            buttonWidth: 300,
                            textLabel: 'Favourite sports'),
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
                                            child:
                                                state.friends.length < index + 1
                                                    ? const Text('')
                                                    : GestureDetector(
                                                        onTap: () => Navigator
                                                            .popAndPushNamed(
                                                                context,
                                                                routeProfilePage,
                                                                arguments: state
                                                                        .friends[
                                                                    index]),
                                                        child: Column(
                                                            children: [
                                                              Stack(children: [
                                                                CircleAvatar(
                                                                  radius: 35,
                                                                  backgroundImage: NetworkImage(state
                                                                      .friends[
                                                                          index]
                                                                      .profileAvatar),
                                                                ),
                                                                Positioned(
                                                                  bottom: 0,
                                                                  right: 0,
                                                                  child:
                                                                      Container(
                                                                    width: 15,
                                                                    height: 15,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                50),
                                                                        color: state.friends[index].isActive
                                                                            ? ColorPallete.greenActiveColor
                                                                            : ColorPallete.greyShadowColorOpacityMax),
                                                                  ),
                                                                ),
                                                              ]),
                                                              Text(state
                                                                  .friends[
                                                                      index]
                                                                  .userName)
                                                            ]),
                                                      )))),
                              );
                            },
                          ),
                          const Divider(),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'check more...',
                              style: AppTextStyle.descriptionMid,
                            ),
                          ),
                        ]),
                  ),
                  const GradientDivider(
                    dividerHeight: 15,
                  ),
                  ContainerTemplate(
                    borderRadius: kMinBorderRadius,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                      right: _generalPagePadding,
                      left: _generalPagePadding,
                    ),
                    color: ColorPallete.whiteOpacity80,
                    padding: const EdgeInsets.all(_generalPagePadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Active Notices",
                              style: AppTextStyle.headersSmall,
                            ),
                            Text(
                              'Total notices: ${context.select((FetchUserNoticeCubit cubit) => cubit.state.userNotices.length)}',
                              style: AppTextStyle.descriptionSmall,
                            )
                          ],
                        ),
                        const Divider(),
                        BlocBuilder<FetchUserNoticeCubit, FetchUserNoticeState>(
                          builder: (context, state) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: state.userNotices.length * 38,
                              child: ListView.builder(
                                  itemCount: state.userNotices.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              state.userNotices[index].content
                                                  .title
                                                  .capitalize(),
                                              style: AppTextStyle
                                                  .descriptionBigger
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            const Row(
                                              children: [
                                                AppIcons.edit,
                                                AppIcons.forward,
                                                AppIcons.delete,
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'category: ${state.userNotices[index].category}',
                                              style:
                                                  AppTextStyle.descriptionSmall,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'comments: ${state.userNotices[index].comments?.length ?? 0}',
                                                  style: AppTextStyle
                                                      .descriptionSmall,
                                                ),
                                                const SizedBox(
                                                  width: kMinEmptySpace,
                                                ),
                                                const Text('view: 100',
                                                    style: AppTextStyle
                                                        .descriptionSmall),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const GradientDivider(
                    dividerHeight: 15,
                    bottomMargin: _generalPagePadding,
                  ),
                ],
              ),
            );
          } else {
            return const Text('to tutaj');
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
