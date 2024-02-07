import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:climbapp/core/utils/helpers/lorem_ipsum.dart';

import 'package:climbapp/presentation/app/business/cubit/theme/theme_cubit.dart';
import 'package:climbapp/presentation/app/widgets/container_template.dart';
import 'package:climbapp/presentation/dashboard/business/bloc/bloc/fetch_notice_bloc.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/single_notice/fetch_single_notice_cubit.dart';
import 'package:climbapp/presentation/sign_in/view/widgets.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/widgets.dart';

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
    late ScrollController scrollController = ScrollController();
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
      ],
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 236, 236),
        body: SingleChildScrollView(
          controller: scrollController,
          child: SafeArea(
              child: Column(
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
                            ))
                      ],
                    );
                  },
                ),

                /* Koniec kategorii użytkownika
                  Początek ogłoszeń
                   */
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 10,
                ),
                padding: const EdgeInsets.all(5),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    boxShadow: [downShadow, greyLeftShadow],
                    borderRadius: BorderRadius.circular(maxBorderRadius)),
                child: Container(
                  margin: const EdgeInsets.all(1),
                  padding: const EdgeInsets.all(1.5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(maxBorderRadius)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(ImagesURL.friendsIcon),
                                  radius: 23,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                        Divider(
                          thickness: 0.5,
                          color: ColorPallete.mainDecorationColor,
                          indent: 20,
                          endIndent: 20,
                        ),
                        Text('$loremIpsum $loremIpsum'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
        drawer: const Drawer(),
        bottomSheet: DownFriendsBar(
          controller: scrollController,
        ),
      ),
    );
  }
}

class DownFriendsBar extends StatefulWidget {
  const DownFriendsBar({
    required this.controller,
    this.durationInMillisecond = 200,
    super.key,
  });
  final ScrollController controller;
  final int durationInMillisecond;

  @override
  State<DownFriendsBar> createState() => _DownFriendsBarState();
}

class _DownFriendsBarState extends State<DownFriendsBar> {
  bool isVisible = true;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_scrollListener);
    widget.controller.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (widget.controller.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        isVisible = false;
      });
    } else {
      setState(() {
        isVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: widget.durationInMillisecond),
      height: isVisible ? MediaQuery.of(context).size.height * 0.115 : 0,
      child: Wrap(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.115,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      gradient: blueGreen,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(maxBorderRadius),
                          topRight: Radius.circular(maxBorderRadius))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0, left: 25.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 20,
                              itemBuilder: (context, index) => Container(
                                    margin: const EdgeInsets.all(5),
                                    width: 30,
                                    height: 30,
                                    color: Colors.blue,
                                    child: Text('new $index'),
                                  )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topCenter,
                child: Text('Active Friends'),
              )
            ],
          ),
        ),
      ]),
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
