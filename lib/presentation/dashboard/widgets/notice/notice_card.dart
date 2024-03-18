import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/like_icon_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/logic/notice_logic.dart';
import 'package:climbapp/presentation/dashboard/widgets/notice/like_action_button.dart';
import 'package:climbapp/presentation/user/widgets/user_view_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/theme/themes_export.dart';
import '../../../../core/utils/helpers/helpers.dart';
import '../../../app/widgets/app_widgets.dart';

/// todo
/// zaimplementować na serwerze i w karcie dodawanie like i join

class NoticeCard extends StatelessWidget {
  const NoticeCard({
    required this.notice,
    required this.onTap,
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
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(notice.avatar),
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
                    // BlocBuilder<LikeIconCubit, bool>(
                    //   builder: (context, state) {
                    //     return LikeActionButton(
                    //       onTap: () => Utils.giveLike(
                    //         context,
                    //         state,
                    //       ),
                    //     );
                    //   },
                    // ),
                    Icon(Icons.mood,
                        size: 30,
                        color: NoticeLogic.didIClick(notice.interested!, userId)
                            ? ColorPallete.greyShadowColorOpacityMax
                            : ColorPallete.mainDecorationColor),
                    const Gap(kMinEmptySpace),
                    const Icon(
                      Icons.maps_ugc,
                      color: ColorPallete.mainDecorationColor,
                      size: 30,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: AppLogoButton(
                    isJoin: NoticeLogic.didIClick(notice.requests!, userId),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Comments: 20',
                      style: AppTextStyle.descriptionMid,
                    )),
              ],
            ),
          ]),
    );
  }
}
