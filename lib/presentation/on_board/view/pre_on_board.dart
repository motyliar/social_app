import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/services/get_it/pre_app_container.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/on_board/business/firstOpen/first_open_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreOnBoard extends StatelessWidget {
  const PreOnBoard({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routePreBoardPage),
        builder: (context) => const PreOnBoard());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FirstOpenCubit, FirstOpenState>(
        builder: (context, state) {
      if (state is FirstOpenSuccess) {
        return state.status.wasOpened ? SignInPage() : const OnBoard();
      }
      return const OnBoard();
    });
  }
}
