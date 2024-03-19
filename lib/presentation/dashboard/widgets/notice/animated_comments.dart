import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/open_close_cubit.dart';
import 'package:flutter/material.dart';

class AnimatedComment extends StatelessWidget {
  const AnimatedComment({required this.open, required this.close, super.key});

  final Widget open;
  final Widget close;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OpenCloseCubit()..changeVisible(change: false),
        child: BlocBuilder<OpenCloseCubit, bool>(
          builder: (context, state) {
            return state
                ? Column(
                    children: [
                      const Text('lalala'),
                      const Text('lalalala'),
                      TextButton(
                          onPressed: () =>
                              context.read<OpenCloseCubit>().changeVisible(),
                          child: const Text('close')),
                    ],
                  )
                : TextButton(
                    onPressed: () =>
                        context.read<OpenCloseCubit>().changeVisible(),
                    child: close);
          },
        ));
  }
}
