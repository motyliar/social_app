import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/scroll_visible_control_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// todo REFACTORING

class BottomBar extends StatelessWidget {
  const BottomBar({required this.controller, super.key});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScrollVisibleControlCubit(controller),
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
                        height: MediaQuery.of(context).size.height * 0.1,
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            gradient: blueGreen,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(maxBorderRadius),
                                topRight: Radius.circular(maxBorderRadius))),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 25.0, left: 25.0),
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
        },
      ),
    );
  }
}
