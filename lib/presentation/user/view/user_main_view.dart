import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/dashboard/widgets/dashboard_appbar.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/business/cubit/cubit/view_switch_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/widgets.dart';
import '../view/subview/subview.dart';

class UserMainView extends StatelessWidget {
  const UserMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewSwitchCubit(),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            return SafeArea(
              child: Scaffold(
                appBar: DashboardAppBar(
                  controller: ScrollController(),
                  mainChild: DashBoardApp(
                    imageSrc: state.user.profileAvatar!,
                    userName: state.user.userName,
                    isSearchBar: false,
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
                      if (state is ViewSwitchSettings) {
                        return AccountSettings();
                      }
                      if (state is ViewSwitchInfo) {
                        return UserInfoo();
                      }
                      if (state is ViewSwitchNotice) {
                        return UserNotice();
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
