import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/presentation/profile/widgets/widgets.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../../core/constans/export_constans.dart';
import '../../../../core/theme/themes_export.dart';

class SingleUserPreview extends StatelessWidget {
  const SingleUserPreview({
    required this.singleUser,
    required this.rightActionIcons,
    this.actionIconLeftPadding = 40,
    this.textStyle,
    this.onTap,
    super.key,
  });
  final FriendsEntity singleUser;
  final List<Widget> rightActionIcons;
  final TextStyle? textStyle;
  final double actionIconLeftPadding;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap != null
          ? onTap!()
          : Navigator.pushNamed(context, routeProfilePage,
              arguments: singleUser),
      child: GeneralCard(
          margin: const EdgeInsets.only(
              top: kMidEmptySpace,
              left: kGeneralPagesMargin,
              right: kGeneralPagesMargin),
          padding: EdgeInsets.only(
              left: kGeneralPagesMargin,
              right: actionIconLeftPadding,
              top: kMinEmptySpace,
              bottom: kMinEmptySpace),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    StatusUserAvatar(
                        radius: kMediumAvatar,
                        activeDotRadius: kDotActiveMedium,
                        dotRightPosition: 0,
                        isActive: singleUser.isActive,
                        avatar: singleUser.profileAvatar),
                    const SizedBox(
                      width: kMidEmptySpace,
                    ),
                    Text(
                      singleUser.userName.capitalize(),
                      style: textStyle ?? AppTextStyle.headersMid,
                    ),
                  ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: rightActionIcons),
              ],
            ),
          ]),
    );
  }
}
