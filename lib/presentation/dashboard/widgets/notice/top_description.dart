import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/network_images.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
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
              padding: const EdgeInsets.only(left: kMinEmptySpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 140,
                        child: Text(
                          notice.content.title,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.headersMid,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Text(
                              notice.author,
                              style: AppTextStyle.descriptionMid,
                            ),
                            const SizedBox(
                              width: kMinEmptySpace,
                            ),
                            Text(notice.createdAt,
                                style: AppTextStyle.descriptionSmall),
                            const SizedBox(
                              width: kMinEmptySpace,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: kMidEmptySpace,
                        ),
                        Text(
                          notice.category.name,
                          style: AppTextStyle.descriptionBig,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: kMidEmptySpace),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ],
    );
  }
}
