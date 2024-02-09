import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/icons/custom_icons.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:climbapp/core/utils/helpers/lorem_ipsum.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/like_icon_cubit.dart';
import 'package:climbapp/presentation/dashboard/widgets/notice_divider.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

const List<BoxShadow> _boxShadows = [downShadow, greyLeftShadow];

class TopNoticeContainer extends StatelessWidget {
  const TopNoticeContainer({
    required this.notice,
    required this.topDescription,
    this.boxShadows = _boxShadows,
    super.key,
  });
  final NoticeEntity notice;
  final List<BoxShadow> boxShadows;
  final Widget topDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: fivePixelsSpaceBetweenWidgets,
        left: fivePixelsSpaceBetweenWidgets,
        top: fivePixelsSpaceBetweenWidgets,
      ),
      padding: const EdgeInsets.all(fivePixelsSpaceBetweenWidgets),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: boxShadows,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(maxBorderRadius),
          topRight: Radius.circular(maxBorderRadius),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(fivePixelsSpaceBetweenWidgets),
        child: Column(
          children: [
            topDescription,
            const GradientDivider(),
            Text(
              notice.content.content,
              style: AppTextStyle.descriptionMid,
            ),
            noticeDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    BlocBuilder<LikeIconCubit, bool>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            context.read<LikeIconCubit>().changeVisible();
                            state
                                ? showDialog(
                                    context: context,
                                    builder: (context) {
                                      Future.delayed(
                                          const Duration(milliseconds: 750),
                                          () {
                                        Navigator.of(context).pop();
                                      });
                                      return Dialog(
                                        elevation: 0,
                                        backgroundColor: Colors.transparent,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: PlayAnimationBuilder(
                                            curve: Curves.bounceIn,
                                            tween: Tween<double>(
                                                begin: 0, end: 90),
                                            duration: const Duration(
                                                milliseconds: 650),
                                            builder: (context, value, _) =>
                                                Icon(
                                              Icons.mood,
                                              size: value,
                                              color: Colors.yellow,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                : null;
                          },
                          child: Icon(
                            Icons.mood,
                            size: 20,
                            color: state ? Colors.grey : Colors.amber,
                          ),
                        );
                      },
                    ),
                    const CustomIcon(
                      Icons.bookmark,
                      color: Colors.grey,
                    ),
                    const CustomIcon(
                      Icons.reply,
                      color: Colors.grey,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Comments 9',
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              width: MediaQuery.of(context).size.width,
              height: 5,
              decoration: BoxDecoration(gradient: blueGreen),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CustomIcon(Icons.bookmark),
                    Text(
                      'Save notice',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomIcon(Icons.comment),
                    Text(
                      'Add comment',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CustomIcon(Icons.reply),
                    Text(
                      'Reply to author',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
