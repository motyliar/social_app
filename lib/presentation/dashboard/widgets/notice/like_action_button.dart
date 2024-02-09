import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/like_icon_cubit.dart';
import 'package:climbapp/presentation/dashboard/widgets/notice/smile_animation.dart';
import 'package:flutter/material.dart';

class LikeActionButton extends StatelessWidget {
  const LikeActionButton({
    required this.onTap,
    super.key,
    this.likeIcon = Icons.mood,
    this.activeColor = Colors.yellow,
    this.inActiveColor = Colors.grey,
    this.iconSize = 20,
  });

  final VoidCallback onTap;
  final IconData likeIcon;
  final Color activeColor;
  final Color inActiveColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikeIconCubit, bool>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => onTap(),
          child: Icon(
            likeIcon,
            size: iconSize,
            color: state ? inActiveColor : activeColor,
          ),
        );
      },
    );
  }
}
