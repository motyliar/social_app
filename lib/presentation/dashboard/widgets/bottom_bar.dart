import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/utils/helpers/params.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/scroll_visible_control_cubit.dart';
import 'package:climbapp/presentation/friends/business/bloc/friends_action_bloc.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// todo REFACTORING

class BottomBar extends StatelessWidget {
  const BottomBar({required this.controller, super.key});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScrollVisibleControlCubit(controller),
        ),
        BlocProvider(
          create: (context) => userLocator<FriendsActionBloc>()
            ..add(
              FetchFriendsListEvent(
                params: GetFriendsParams(userId: user.id),
              ),
            ),
        ),
      ],
      child: BlocBuilder<ScrollVisibleControlCubit, bool>(
        builder: (context, isVisible) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
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
                        height: MediaQuery.of(context).size.height * 0.09,
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            gradient: blueGreen,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(maxBorderRadius),
                                topRight: Radius.circular(maxBorderRadius))),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 25.0, left: 25.0),
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: BlocBuilder<FriendsActionBloc,
                                      FriendsActionState>(
                                    builder: (context, state) {
                                      final friends = state.friends
                                          .where((element) =>
                                              element.isActive == true)
                                          .toList();

                                      return ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: friends.length,
                                          itemBuilder: (context, index) =>
                                              GestureDetector(
                                                onTap: () =>
                                                    Navigator.pushNamed(context,
                                                        routeProfilePage,
                                                        arguments:
                                                            friends[index]),
                                                child: Stack(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8.0),
                                                    child: CircleAvatar(
                                                        radius: 25,
                                                        backgroundImage:
                                                            NetworkImage(friends[
                                                                    index]
                                                                .profileAvatar)),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomLeft,
                                                    child: Icon(
                                                      Icons.sports_volleyball,
                                                      color: Colors.green,
                                                      size: 15,
                                                    ),
                                                  )
                                                ]),
                                              ));
                                    },
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.topCenter,
                    //   child: Text(
                    //     'Active Friends',
                    //     style: AppTextStyle.headersSmall.copyWith(
                    //         color: ColorPallete.pinkDecorationColor,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    // )
                  ],
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
