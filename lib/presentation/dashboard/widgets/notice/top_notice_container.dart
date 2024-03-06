import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/message_view.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/dashboard/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
    final l10n = context.l10n;
    return Container(
      margin: const EdgeInsets.only(
        right: kMinEmptySpace,
        left: kMinEmptySpace,
        top: kMinEmptySpace,
      ),
      padding: const EdgeInsets.all(kMinEmptySpace),
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
        padding: const EdgeInsets.all(kMinEmptySpace),
        child: Column(
          children: [
            topDescription,
            const GradientDivider(),
            Text(
              notice.content.content.cut,
              style: AppTextStyle.descriptionMid,
            ),
            noticeDivider(),
            const SummaryRow(),
            const GradientDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DescriptionIcon(icon: Icons.bookmark, text: l10n.noticeSave),
                DescriptionIcon(
                    icon: Icons.comment, text: l10n.noticeAddComment),
                DescriptionIcon(
                  icon: Icons.reply,
                  text: l10n.noticeReply,
                  onTap: () => Navigator.pushNamed(context, routeMessagePage,
                      arguments: MessageViewParams(
                          view: MessageView.other,
                          friend: noticeToFriend(notice))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  FriendsEntity noticeToFriend(NoticeEntity notice) => FriendsEntity(
      id: notice.authorId,
      userName: notice.author,
      profileAvatar: '',
      isActive: false,
      lastLoggedIn: '');
}
