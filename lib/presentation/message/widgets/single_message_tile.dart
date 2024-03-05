import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/presentation/user/widgets/user_view_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SingleMessageTile extends StatelessWidget {
  const SingleMessageTile({
    super.key,
    required this.today,
    required this.avatar,
    required this.description,
    required this.isSelected,
    required this.isRead,
    this.notSelectedColor = ColorPallete.whiteOpacity80,
    this.selectedColor = ColorPallete.greyShadowColorOpacityMax,
    this.notReadColor = ColorPallete.mainDecorationColor,
    this.padding,
    this.margin,
  });

  final String today;
  final Widget avatar;
  final Widget description;
  final bool isSelected;
  final bool isRead;
  final Color notSelectedColor;
  final Color selectedColor;
  final Color notReadColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return UserViewCard(
        padding:
            padding ?? const EdgeInsets.only(left: 15, top: 15, bottom: 10),
        color: isSelected
            ? selectedColor
            : isRead
                ? notSelectedColor
                : notReadColor,
        margin: margin ??
            const EdgeInsets.only(
                top: kMinEmptySpace,
                left: kMidEmptySpace,
                right: kMidEmptySpace,
                bottom: kMinEmptySpace),
        children: [
          Row(
            children: [
              avatar,
              const Gap(kMidEmptySpace),
              description,
            ],
          ),
        ]);
  }
}
