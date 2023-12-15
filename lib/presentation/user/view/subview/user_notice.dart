import 'package:climbapp/presentation/user/business/cubit/cubit/view_switch_cubit.dart';
import 'package:climbapp/presentation/user/business/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNotice extends StatelessWidget {
  const UserNotice({super.key});

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
        Text('Notice')
      ],
    );
  }
}
