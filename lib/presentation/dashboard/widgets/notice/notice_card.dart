import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/utils/helpers/lorem_ipsum.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/dashboard/business/logic/notice_logic.dart';
import 'package:climbapp/presentation/dashboard/widgets/notice/animated_comments.dart';
import 'package:climbapp/presentation/dashboard/widgets/notice/like_action_button.dart';
import 'package:climbapp/presentation/dashboard/widgets/notice/smile_animation.dart';
import 'package:climbapp/presentation/user/widgets/user_view_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/themes_export.dart';
import '../../../../core/utils/helpers/helpers.dart';
import '../../../app/widgets/app_widgets.dart';

/// todo

/// zrobienie funkcji która po dacie będzie rozpoznwać czy jest to data dzisiejsza

TextEditingController _commentsController = TextEditingController();

class NoticeCard extends StatelessWidget {
  const NoticeCard({
    required this.notice,
    required this.onTap,
    required this.logoOnTap,
    required this.logoOnTapBack,
    required this.smileOnTap,
    required this.smileOnTapBack,
    required this.userId,
    this.style = AppTextStyle.descriptionMid,
    this.localizationStyle = AppTextStyle.descriptionMid,
    this.dataStyle = AppTextStyle.descriptionMid,
    super.key,
  });
  final NoticeEntity notice;
  final TextStyle style;
  final TextStyle localizationStyle;
  final TextStyle dataStyle;
  final VoidCallback onTap;
  final VoidCallback logoOnTap;
  final VoidCallback logoOnTapBack;
  final VoidCallback smileOnTap;
  final VoidCallback smileOnTapBack;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: GeneralCard(
          margin: const EdgeInsets.only(
              bottom: kMidEmptySpace,
              left: kMidEmptySpace,
              right: kMidEmptySpace),
          padding: const EdgeInsets.only(
              top: kGeneralPagesMargin,
              left: kGeneralPagesMargin,
              right: kGeneralPagesMargin),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 5,
                  backgroundColor: notice.isActive
                      ? ColorPallete.greenActiveColor
                      : ColorPallete.greyShadowColorOpacityMax,
                ),
                const Gap(kMidEmptySpace),
                HeadersSmallText(
                  text: notice.category.name.toUpperCase(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 2,
                              offset: Offset(1, 1),
                              color: Colors.grey),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.popAndPushNamed(
                            context, routeProfilePage,
                            arguments: FriendsEntity(
                                id: notice.authorId,
                                userName: '',
                                profileAvatar: '',
                                isActive: false,
                                lastLoggedIn: '')),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(notice.avatar),
                        ),
                      ),
                    ),
                    const Gap(kMinEmptySpace),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notice.content.title,
                          style: style.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          notice.localization!,
                          style: localizationStyle,
                        ),
                        Text(
                          //todo create today function
                          notice.content.when ?? '',
                          style: dataStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            Text(
              notice.content.content,
              style: style,
            ),
            const GradientDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    LikeActionButton(
                        isLike:
                            NoticeLogic.didIClick(notice.interested!, userId),
                        onTap: NoticeLogic.didIClick(notice.interested!, userId)
                            ? () => smileOnTapBack()
                            : () {
                                smileOnTap();
                                Utils.showSuccessDialog(
                                    context, const SmileAnimation());
                              }),
                    const Gap(kMinEmptySpace),
                    GestureDetector(
                      onTap: () => NoticeLogic.addCommentSheet(
                          context, _commentsController, notice),
                      child: const Icon(
                        Icons.maps_ugc,
                        color: ColorPallete.mainDecorationColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: AppLogoButton(
                    onTap: () => NoticeLogic.didIClick(notice.requests!, userId)
                        ? logoOnTapBack()
                        : logoOnTap(),
                    isJoin: NoticeLogic.didIClick(notice.requests!, userId),
                  ),
                ),
              ],
            ),
            const Divider(),
            AnimatedComment(
                comments: notice.comments ?? [],
                open: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  color: Colors.red,
                  child: const Text(loremIpsum),
                ),
                close: Text(
                  'Comments: ${notice.comments?.length ?? 0}',
                  style: AppTextStyle.descriptionMid,
                )),
          ]),
    );
  }
}
