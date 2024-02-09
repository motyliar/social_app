import 'package:climbapp/core/constans/export_constans.dart';

import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/icons/custom_icons.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:climbapp/core/utils/helpers/lorem_ipsum.dart';

import 'package:climbapp/presentation/app/business/cubit/theme/theme_cubit.dart';
import 'package:climbapp/presentation/app/widgets/container_template.dart';
import 'package:climbapp/presentation/dashboard/business/bloc/bloc/fetch_notice_bloc.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/like_icon_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/scroll_visible_control_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/slidable_menu_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/single_notice/fetch_single_notice_cubit.dart';

import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_animations/simple_animations.dart';
import '../widgets/widgets.dart';

ScrollController scrollController = ScrollController();

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeDashboardPage),
      builder: (_) => const DashboardPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('main build');

    ScrollController listViewController = ScrollController();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userLocator<FetchNoticeBloc>()
            ..add(
              FetchNoticesFromDB(
                params: GetNoticeParams(
                  url: AppUrl.noticePaginationURL(1, 4),
                ),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => userLocator<FetchSingleNoticeCubit>()
            ..emitResultOfFetching(GetNoticeParams(
                url: AppUrl.singleNoticeURL("65789782866f56088bd20eac"))),
        ),
        BlocProvider(create: (context) => SlidableMenuCubit()),
        BlocProvider(
            create: (context) => ScrollVisibleControlCubit(scrollController)),
        BlocProvider(create: (context) => LikeIconCubit()),
      ],
      child: Scaffold(
        backgroundColor: ColorPallete.scaffoldBackground,
        body: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BlocConsumer<UserBloc, UserState>(
                      listener: (context, state) {
                        if (state is UserLoaded) {
                          context.read<ThemeCubit>().changeThemeData(
                                mode: state.user.preferences?.mode ?? false,
                              );
                        }
                      },
                      builder: (context, state) {
                        return BlocBuilder<UserBloc, UserState>(
                            builder: (context, state) {
                          if (state is UserLoaded) {
                            context.read<ThemeCubit>().changeThemeData(
                                  mode: state.user.preferences?.mode ?? false,
                                );
                            return DashboardAppBar(
                                imageSrc: state.user.profileAvatar!,
                                userName: state.user.userName);
                          }
                          return const Text('failed');
                        });
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 100,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10, top: 15, bottom: 15),
                                child: ContainerTemplate(
                                  color: Colors.white,
                                  gradient: redLinearGradientTopToBottom,
                                  width: 120,
                                  height: 50,
                                  child: const Align(
                                      alignment: Alignment.center,
                                      child: Text('Messages')),
                                ),
                              ),
                              Positioned(
                                child: Image.network(
                                  ImagesURL.waveIcon,
                                  width: 120,
                                  height: 120,
                                ),
                              ),
                              Positioned(
                                  top: 0,
                                  right: 12,
                                  child: Image.network(
                                    ImagesURL.messageIcon,
                                    width: 40,
                                    height: 40,
                                  )),
                              Positioned(
                                  top: 100,
                                  left: 0,
                                  child: Container(
                                    width: 10,
                                    height: 15,
                                    color: Colors.black,
                                  ))
                            ],
                          );
                        },
                      ),

                      /* Koniec kategorii użytkownika
                    Początek ogłoszeń
                     */
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        controller: listViewController,
                        itemCount: 3,
                        itemBuilder: (context, index) => const SingleNotice(),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.4,
                right: 0,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SlidableMenu(
                      windowName: 'first',
                    ),
                    SlidableMenu(
                      windowName: 'second',
                    ),
                    SlidableMenu(
                      windowName: 'third',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: BottomBar(
          controller: scrollController,
        ),
      ),
    );
  }
}

class SingleNotice extends StatelessWidget {
  const SingleNotice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(maxBorderRadius),
          topRight: Radius.circular(maxBorderRadius),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(
          right: 5,
          left: 5,
          top: 5,
        ),
        padding: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [downShadow, greyLeftShadow],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(maxBorderRadius),
            topRight: Radius.circular(maxBorderRadius),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(ImagesURL.friendsIcon),
                        radius: 23,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Category',
                              style: TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Text(
                                  'User name',
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text('10.01.2023',
                                    style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.more_vert),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'CLIMBING',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                width: MediaQuery.of(context).size.width,
                height: 5,
                decoration: BoxDecoration(gradient: blueGreen),
              ),
              const Text(loremIpsumMid),
              noticeDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      BlocBuilder<LikeIconCubit, bool>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              context.read<LikeIconCubit>().changeVisible();
                              state
                                  ? showDialog(
                                      context: context,
                                      builder: (context) {
                                        Future.delayed(
                                            const Duration(milliseconds: 750),
                                            () {
                                          Navigator.of(context).pop();
                                        });
                                        return Dialog(
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: PlayAnimationBuilder(
                                              curve: Curves.bounceIn,
                                              tween: Tween<double>(
                                                  begin: 0, end: 90),
                                              duration: const Duration(
                                                  milliseconds: 650),
                                              builder: (context, value, _) =>
                                                  Icon(
                                                Icons.mood,
                                                size: value,
                                                color: Colors.yellow,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : null;
                            },
                            child: Icon(
                              Icons.mood,
                              size: 20,
                              color: state ? Colors.grey : Colors.amber,
                            ),
                          );
                        },
                      ),
                      const CustomIcon(
                        Icons.bookmark,
                        color: Colors.grey,
                      ),
                      const CustomIcon(
                        Icons.reply,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Comments 9',
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                width: MediaQuery.of(context).size.width,
                height: 5,
                decoration: BoxDecoration(gradient: blueGreen),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CustomIcon(Icons.bookmark),
                      Text(
                        'Save notice',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomIcon(Icons.comment),
                      Text(
                        'Add comment',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CustomIcon(Icons.reply),
                      Text(
                        'Reply to author',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlidableMenu extends StatelessWidget {
  const SlidableMenu({
    this.padding = 5.0,
    required this.windowName,
    super.key,
  });
  final String windowName;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidableMenuCubit, Map<String, bool>>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: padding),
          child: GestureDetector(
              onTap: () => BlocProvider.of<SlidableMenuCubit>(context)
                  .changeVisible(windowName),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                width: state[windowName]! ? 35 : 200,
                height: state[windowName]! ? 35 : 300,
                decoration: BoxDecoration(
                    color: ColorPallete.mainDecorationColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(maxBorderRadius),
                    boxShadow: [greyLeftShadow]),
                curve: Curves.easeIn,
                child: state[windowName]!
                    ? const Icon(
                        Icons.settings,
                        color: Colors.white,
                      )
                    : Wrap(children: [
                        Column(
                          children: [
                            TextButton(
                                onPressed: () {}, child: const Text('elo')),
                            TextButton(
                                onPressed: () {}, child: const Text('elo')),
                            TextButton(
                                onPressed: () {}, child: const Text('elo')),
                            TextButton(
                                onPressed: () {}, child: const Text('elo')),
                            TextButton(
                                onPressed: () {}, child: const Text('elo')),
                          ],
                        ),
                      ]),
              )),
        );
      },
    );
  }
}

/* stare implementacje bloca do wglądu 

 BlocBuilder<FetchNoticeBloc, FetchNoticeState>(
                builder: (context, state) {
              if (state is FetchNoticeLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              print('tutaj sprawdzamy //${state.notices}');
              return Column(
                children: [
                  Text(state.notices[0].author),
                  Text(state.notices[0].category),
                  Text(state.notices[0].content.content)
                ],
              );
            }),
            BlocBuilder<FetchSingleNoticeCubit, FetchSingleNoticeState>(
              builder: (context, state) {
                return Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                        'Single notice author ${state.notice?.author ?? 'no auther yet'}'),
                  ],
                );
              },
            )

            */
