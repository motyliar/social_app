import 'dart:math';

import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/presentation/user/widgets/user_view_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NoticeLoader extends StatelessWidget {
  const NoticeLoader({required this.numberOFContainer, super.key});

  final int numberOFContainer;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: List.generate(
          numberOFContainer,
          (index) => GeneralCard(
              margin: const EdgeInsets.only(
                  right: kMidEmptySpace,
                  left: kMidEmptySpace,
                  bottom: kMidEmptySpace),
              color: Colors.white.withOpacity(0.3),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const _ProgressBox(width: 50),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.grey.withOpacity(0.3),
                        ),
                        const Gap(5),
                        const _ProgressBox(
                          width: 60,
                          height: 15,
                        )
                      ],
                    ),
                  ],
                ),
                const Gap(5),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProgressBox(
                      width: 60,
                      height: 60,
                      borderRadius: 50,
                    ),
                    Gap(5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(5),
                        _ProgressBox(
                          width: 150,
                        ),
                        Gap(5),
                        _ProgressBox(
                          width: 50,
                          height: 12,
                        ),
                        Gap(5),
                        _ProgressBox(width: 80),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.3),
                ),
                Wrap(
                  spacing: 2,
                  runSpacing: 2,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  children: List.generate(
                      Random().nextInt(10) + 5,
                      (index) => Container(
                            width: Random().nextInt(30) + 70.toDouble(),
                            height: 15,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20)),
                          )),
                ),
                Divider(
                  color: Colors.grey.withOpacity(0.3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey.withOpacity(0.3),
                        ),
                        const Gap(5),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey.withOpacity(0.3),
                        ),
                      ],
                    ),
                    const _ProgressBox(
                      width: 90,
                      height: 40,
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}

class _ProgressBox extends StatelessWidget {
  const _ProgressBox({
    required this.width,
    this.height = 15,
    this.borderRadius = 20,
  });

  final double height;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: LinearProgressIndicator(
        color: Colors.grey.withOpacity(0.3),
        backgroundColor: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
