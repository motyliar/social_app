import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/sports/get_sports_params.dart';
import 'package:climbapp/core/routers/animation_route.dart';
import 'package:climbapp/core/services/get_it/sport_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/presentation/app.dart';

import 'package:climbapp/presentation/dashboard/widgets/dashboard_appbar.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/business/cubit/load_sport/load_sport_cubit.dart';
import 'package:climbapp/presentation/user/business/cubit/view_switch/view_switch_cubit.dart';

import 'package:flutter/material.dart';

import '../view/subview/subview.dart';

const double _appBarHeight = 100;

class UserMainView extends StatelessWidget {
  const UserMainView({super.key});

  static Route<dynamic> route() {
    return AnimationRoute.slideDownRoute(
      direction: const UserMainView(),
      route: routeUserMain,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final scrollController = ScrollController();
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ViewSwitchCubit(),
          ),
          BlocProvider(
            create: (context) => sportLocator<LoadSportCubit>()
              ..getUserSports(
                  GetSportParams(url: AppUrl.getUserSportsURL(user.id))),
          ),
        ],
        child: SafeArea(
          child: Scaffold(
            backgroundColor: ColorPallete.scaffoldBackground,
            appBar: DashboardAppBar(
              height: _appBarHeight,
              controller: scrollController,
              mainChild: DashBoardApp(
                isAnimateImage: true,
                controller: scrollController,
                imageSrc: user.profileAvatar!,
                userName: user.userName,
                isSearchBar: false,
                isProfile: true,
                profileImageFunction: () =>
                    debugPrint('profile image function test'),
              ),
            ),
            body: SingleChildScrollView(
              child: BlocBuilder<ViewSwitchCubit, ViewSwitchState>(
                builder: (context, state) {
                  if (state is ViewSwitchInitial) {
                    return const UserPage();
                  }
                  if (state is ViewSwitchSport) {
                    return const UserSport();
                  }

                  if (state is ViewSwitchInfo) {
                    return const UserDetails();
                  } else {
                    return const UserPage();
                  }
                },
              ),
            ),
          ),
        ));
  }
}
