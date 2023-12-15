import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/user/repository/user_repository.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/business/cubit/cubit/view_switch_cubit.dart';
import 'package:climbapp/presentation/user/business/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ViewSwitchCubit, ViewSwitchState>(
          builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  context.read<ViewSwitchCubit>().changeStatus(ViewStatus.main);
                },
                child: Text('BACK'));
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              Text('Profile avatar:'),
              SizedBox(
                width: 10,
              ),
              BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                if (state is UserLoaded) {
                  return ElevatedButton(
                      onPressed: () {
                        context.read<UserBloc>().add(UpdateUserEvent(
                                stringUpdate: UpdateUserParams<String>(
                              userId: state.user.id,
                              token: state.params!.token,
                              toUpdate: updateMap.avatar(
                                  "https://img.freepik.com/premium-wektory/rhino-head-logo-design-sport-esport-maskotka-projektowanie-postaci-cartoon-vector-art_81874-169.jpg"),
                            )));
                      },
                      child: Text('change'));
                }
                return Text('null');
              }),
            ],
          ),
        ),
      ],
    );
  }
}
