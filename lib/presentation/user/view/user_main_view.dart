import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/user/business/cubit/cubit/view_switch_cubit.dart';
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
      child: Scaffold(
        appBar:
            UserAppBar(size: MediaQuery.of(context).size.width, name: 'name'),
        body: BlocBuilder<ViewSwitchCubit, ViewSwitchState>(
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
              return UserInfo();
            }
            if (state is ViewSwitchNotice) {
              return UserNotice();
            } else {
              return UserPage();
            }
          },
        ),
      ),
    );
  }
}
