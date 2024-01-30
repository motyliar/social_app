import 'dart:ui';

import 'package:climbapp/core/constans/app_localization_list.dart';
import 'package:climbapp/core/constans/network_images.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/datahelpers/params/onboard/on_board_params.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/presentation/app/business/cubit/localization/locale_cubit.dart';
import 'package:climbapp/presentation/helpers/painters/circle_painter.dart';
import 'package:climbapp/presentation/on_board/business/cubit/image_changer_cubit.dart';
import 'package:climbapp/presentation/on_board/business/dot_state/dot_state_cubit.dart';
import 'package:climbapp/presentation/on_board/business/firstOpen/first_open_cubit.dart';
import 'package:climbapp/presentation/on_board/view/widdgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_animations/simple_animations.dart';

const String _polishLanguageSign = 'PL';
const String _englishLanguageSign = 'EN';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeOnBoard),
      builder: (_) => const OnBoard(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final circles = CirclePainter();

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DotStateCubit.instance(),
          ),
          BlocProvider(
            create: (context) =>
                ImageChangerCubit.instance()..timerImager(true),
          ),
        ],
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Stack(
              children: [
                CustomPaint(
                  painter: BoardPainter(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Positioned(
                  top: 160,
                  right: 50,
                  child: LoopAnimationBuilder(
                      tween: Tween(begin: 150.0, end: 300.0),
                      duration: Duration(seconds: 3),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Container(
                          width: value,
                          height: value,
                          child: MirrorAnimationBuilder<double>(
                              tween: Tween(begin: -20, end: 60),
                              duration: const Duration(seconds: 3),
                              curve: Curves.easeOut,
                              builder: (context, value, child) {
                                return Transform.translate(
                                  offset: Offset(20, value),
                                  child: child,
                                );
                              },
                              child: BlocBuilder<ImageChangerCubit, int>(
                                builder: (context, state) {
                                  return Image.network(
                                    NetworkURLStorage().getImages[state],
                                    width: 300,
                                    height: 300,
                                  );
                                },
                              )),
                        );
                      }),
                ),
                Positioned(
                    bottom: 40,
                    right: 30,
                    child: ElevatedButton(
                      onPressed: () =>
                          ImageChangerCubit.instance()..timerImager(false),
                      child: Text('stop'),
                    )),
                Positioned(
                    bottom: 0,
                    right: 30,
                    child: ElevatedButton(
                      onPressed: () =>
                          ImageChangerCubit.instance()..timerImager(true),
                      child: Text('start'),
                    )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: List.generate(
                      20,
                      (index) => CustomPositioned(begin: 20, end: 50),
                    ),
                  ),
                )

                // CustomPositioned(begin: 20, end: 50),
                // CustomPositioned(begin: 25, end: 75),
                // CustomPositioned(begin: 40, end: 5),
                // CustomPositioned(begin: 32, end: 1),
                // CustomPositioned(begin: 30, end: 80),
                // CustomPositioned(begin: 1, end: 30),
                // CustomPositioned(begin: 21, end: 15),
              ],
            ),
          )),
        ));
  }
}

class BoardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path orangeArc = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(0, size.height * 0.7)
      ..quadraticBezierTo(
          size.width * 0.5, size.height, size.width, size.height * 0.7)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(orangeArc, Paint()..color = Colors.orange);

    Path whiteArc = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(0.0, size.height * 0.65)
      ..quadraticBezierTo(
          size.width * 0.5, size.height - 70, size.width, size.height * 0.65)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(whiteArc, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MiddlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path orangeArc = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.5)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(orangeArc, Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// Scaffold(
//         body: SafeArea(
//             child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   BlocBuilder<LocaleCubit, String>(
//                     builder: (context, state) {
//                       return Padding(
//                         padding: const EdgeInsets.all(11.0),
//                         child: Row(
//                           children: [
//                             ElevatedButton(
//                                 onPressed: () {
//                                   context.read<LocaleCubit>().polishLanguage();
//                                 },
//                                 child: const Text(_polishLanguageSign)),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             ElevatedButton(
//                                 onPressed: () {
//                                   context.read<LocaleCubit>().englishLanguage();
//                                 },
//                                 child: const Text(_englishLanguageSign)),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         right: MediaQuery.of(context).size.height * 0.04,
//                         top: 20),
//                     child: Align(
//                       alignment: Alignment.topRight,
//                       child: BlocBuilder<FirstOpenCubit, FirstOpenState>(
//                         builder: (context, state) {
//                           return ElevatedButton(
//                               onPressed: () {
//                                 Navigator.pushNamed(context, routeSignInPage);
//                                 context.read<FirstOpenCubit>().changeOpenStatus(
//                                     const OnBoardParam(wasOpened: false));
//                               },
//                               child: Text(AppLocalizations.of(context)
//                                   .skip
//                                   .toUpperCase()));
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height - 120,
//                 child: PageView.builder(
//                     onPageChanged: (value) {
//                       DotStateCubit.instance().changeDotValue(value);
//                       print(DotStateCubit.instance().state);
//                     },
//                     scrollDirection: Axis.horizontal,
//                     itemCount: NetworkURLStorage().getImages.length,
//                     itemBuilder: (context, index) {
//                       return Stack(
//                         children: [
//                           Positioned(
//                               top: 50,
//                               left: 30,
//                               child: Text(OnBoardLabelList()
//                                   .listBuilder(context)[index])),
//                           Positioned(
//                               top: 70,
//                               left: 30,
//                               child: Text(OnBoardContentList()
//                                   .listBuilder(context)[index])),
//                           Positioned(
//                             top: 20,
//                             child: Container(
//                               width: MediaQuery.of(context).size.width,
//                               height: MediaQuery.of(context).size.height - 160,
//                               decoration: BoxDecoration(
//                                 color: Colors.amber,
//                               ),
//                               child: Image.network(
//                                 NetworkURLStorage().getImages[index],
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                               bottom: 20,
//                               right: 30,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: List.generate(
//                                     3,
//                                     (dotIndex) => GestureDetector(
//                                           onTap: () {
//                                             index = dotIndex;
//                                             print(MediaQuery.of(context)
//                                                 .size
//                                                 .width);
//                                           },
//                                           child: Container(
//                                             margin: const EdgeInsets.all(3),
//                                             width: index == dotIndex ? 30 : 20,
//                                             height: 15,
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(50),
//                                                 color: index == dotIndex
//                                                     ? const Color.fromARGB(
//                                                         255, 221, 45, 32)
//                                                     : Colors.black),
//                                           ),
//                                         )),
//                               ))
//                         ],
//                       );
//                     }),
//               ),
//               BlocBuilder<DotStateCubit, int>(
//                 builder: (context, state) {
//                   return Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(
//                         3,
//                         (indexDot) => Container(
//                             margin: const EdgeInsets.all(5),
//                             width: 10,
//                             height: 20,
//                             color: state == indexDot
//                                 ? Colors.yellow
//                                 : Colors.teal)),
//                   );
//                 },
//               )
//             ],
//           ),
//         )),
//       ),
