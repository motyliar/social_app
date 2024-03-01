import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/dashboard/widgets/dashboard_appbar.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/business/cubit/cubit/view_switch_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/widgets.dart';
import '../view/subview/subview.dart';

const double _appBarHeight = 100;

class UserMainView extends StatelessWidget {
  const UserMainView({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeUserMain),
      builder: (_) => UserMainView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return BlocProvider(
      create: (context) => ViewSwitchCubit(),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: ColorPallete.scaffoldBackground,
                appBar: DashboardAppBar(
                  height: _appBarHeight,
                  controller: scrollController,
                  mainChild: DashBoardApp(
                    isAnimateImage: true,
                    controller: scrollController,
                    imageSrc: state.user.profileAvatar!,
                    userName: state.user.userName,
                    isSearchBar: false,
                    isProfile: true,
                  ),
                ),
                body: SingleChildScrollView(
                  child: BlocBuilder<ViewSwitchCubit, ViewSwitchState>(
                    builder: (context, state) {
                      if (state is ViewSwitchInitial) {
                        return UserPage();
                      }
                      if (state is ViewSwitchSport) {
                        return UserSport();
                      }

                      if (state is ViewSwitchInfo) {
                        return UserDetails();
                      } else {
                        return UserPage();
                      }
                    },
                  ),
                ),
              ),
            );
          } else {
            return UserPage();
          }
        },
      ),
    );
  }
}
