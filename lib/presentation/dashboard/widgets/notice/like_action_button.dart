import 'package:climbapp/core/theme/colors.dart';

import 'package:flutter/material.dart';

class LikeActionButton extends StatelessWidget {
  const LikeActionButton({
    required this.onTap,
    required this.isLike,
    super.key,
    this.likeIcon = Icons.mood,
    this.activeColor = ColorPallete.mainDecorationColor,
    this.inActiveColor = Colors.grey,
    this.iconSize = 30,
  });

  final VoidCallback onTap;
  final IconData likeIcon;
  final Color activeColor;
  final Color inActiveColor;
  final double iconSize;
  final bool isLike;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Icon(
        likeIcon,
        size: iconSize,
        color: isLike ? activeColor : inActiveColor,
      ),
    );
  }
}
