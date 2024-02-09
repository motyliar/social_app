import 'package:climbapp/core/theme/icons/custom_icons.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/like_icon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';

class SummaryRow extends StatelessWidget {
  const SummaryRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                        ? showSuccessDialog(context, const SmileAnimation())
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
    );
  }

  Future<dynamic> showSuccessDialog(BuildContext context, Widget child) {
    return showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(milliseconds: 750), () {
          Navigator.of(context).pop();
        });
        return child;
      },
    );
  }
}

class SmileAnimation extends StatelessWidget {
  const SmileAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Align(
        alignment: Alignment.center,
        child: PlayAnimationBuilder(
          curve: Curves.bounceIn,
          tween: Tween<double>(begin: 0, end: 90),
          duration: const Duration(milliseconds: 650),
          builder: (context, value, _) => Icon(
            Icons.mood,
            size: value,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
