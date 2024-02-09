import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/network_images.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:flutter/material.dart';

const double _avatarSize = 23;
const IconData _icon = Icons.more_vert;

class TopDescription extends StatelessWidget {
  const TopDescription({
    required this.notice,
    this.avatarSize = _avatarSize,
    this.icon = _icon,
    this.iconColor = ColorPallete.pinkDecorationColor,
    super.key,
  });

  final NoticeEntity notice;
  final double avatarSize;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: const NetworkImage(ImagesURL.friendsIcon),
              radius: avatarSize,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: fivePixelsSpaceBetweenWidgets),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notice.content.title.isTooLong,
                    softWrap: true,
                    style: AppTextStyle.headersMid,
                  ),
                  Row(
                    children: [
                      Text(
                        notice.author,
                        style: AppTextStyle.descriptionMid,
                      ),
                      const SizedBox(
                        width: fivePixelsSpaceBetweenWidgets,
                      ),
                      Text(notice.createdAt,
                          style: AppTextStyle.descriptionSmall),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: tenPixelsSpaceBetweenWidgets),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              const SizedBox(
                width: fivePixelsSpaceBetweenWidgets,
              ),
              Text(
                notice.category.toUpperCase(),
                style: AppTextStyle.descriptionBigger,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
