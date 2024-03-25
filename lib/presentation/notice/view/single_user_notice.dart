import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';

import 'package:climbapp/presentation/notice/widgets/widgets.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// todo
// zaimplementować import użytkowników którzy klikneli request i zrobić obsługę zdarzenia , tak lub nie
// dodać implementację notification i wtedy mamy już praktycznie wszystko,
//edycja własnej notatki

class SingleUserNotice extends StatelessWidget {
  const SingleUserNotice(
      {required this.notice,
      this.textStyle = AppTextStyle.descriptionMid,
      super.key});
  static Route<dynamic> route({
    required SingleNoticeParams params,
  }) {
    return Utils.animatedRoute(
        direction: SingleUserNotice(
          notice: params.notice,
        ),
        route: routeSingleUserNotice);
  }

  final NoticeEntity notice;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              BackCard(
                onBack: () {
                  Navigator.pop(context);
                },
              ),
              GeneralCard(children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AppIcons.smile,
                          const Gap(kMidEmptySpace),
                          HeadersSmallText(
                              text: notice.interested?.length.toString() ?? '0')
                        ],
                      ),
                      ActiveCategory(notice: notice),
                    ],
                  ),
                ),
                const Gap(kMidEmptySpace),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadersSmallText(text: notice.content.title),
                    EditButton(
                      text: l10n.editText,
                      onTap: () {},
                    ),
                  ],
                ),
                const Divider(),
                Align(
                  alignment: Alignment.centerRight,
                  child: EditButton(text: l10n.editText, onTap: () {}),
                ),
                Text(
                  notice.content.content,
                  style: textStyle,
                ),
                const GradientDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadersSmallText(
                      text: notice.content.when ?? 'data',
                    ),
                    EditButton(text: l10n.editText, onTap: () {}),
                  ],
                ),
                const Gap(kMidEmptySpace),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadersSmallText(
                        text: notice.localization == ''
                            ? 'localization'
                            : notice.localization!),
                    EditButton(text: l10n.editText, onTap: () {}),
                  ],
                ),
                const Gap(kMidEmptySpace),
                const Divider(),
                HeadersSmallText(text: l10n.commentText),
                const Divider(
                  endIndent: 200,
                ),
                const Gap(kMidEmptySpace),
                Column(
                  children: List.generate(
                    notice.comments == null ? 0 : notice.comments!.length,
                    (index) => SingleCommentUserNotice(
                      notice: notice,
                      index: index,
                    ),
                  ),
                ),
                const Divider(),
              ]),
              const Gap(kGeneralPagesMargin),
              GeneralCard(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const HeadersSmallText(text: 'Requests'),
                    HeadersSmallText(
                        text: notice.requests?.length.toString() ?? '0'),
                  ],
                ),
                const GradientDivider(),
                const Gap(kMidEmptySpace),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ProfileAvatar(
                              url: notice.comments![0].avatar,
                              radius: 25,
                            ),
                            const Gap(kGeneralPagesMargin),
                            HeadersSmallText(text: notice.comments![0].user),
                          ],
                        ),
                        Thumbs(
                          thumbUp: () {},
                          thumbDown: () {},
                        ),
                      ],
                    ),
                  ],
                )
              ]),
              const PageEnd(),
            ],
          ),
        ),
      ),
    );
  }
}

class SingleCommentUserNotice extends StatelessWidget {
  const SingleCommentUserNotice({
    super.key,
    required this.notice,
    required this.index,
  });

  final NoticeEntity notice;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProfileAvatar(
              url: notice.comments![index].avatar,
            ),
            Row(
              children: [
                Text(
                  notice.comments![index].user,
                  style: AppTextStyle.descriptionBig
                      .copyWith(fontWeight: FontWeight.bold, letterSpacing: 2),
                ),
                const Gap(kMidEmptySpace),
                Text(
                  notice.comments![index].createdAt.cutTo(10),
                  style: AppTextStyle.descriptionMid,
                ),
              ],
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 280,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: ColorPallete.mainDecorationColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Text(
              notice.comments![index].content.capitalize(),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    required this.url,
    this.radius = 18,
    this.onTap,
  });

  final String url;
  final double radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: 18,
        backgroundImage: NetworkImage(url),
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Text(
        text,
        style: AppTextStyle.descriptionMid,
      ),
    );
  }
}

class SingleNoticeParams {
  const SingleNoticeParams({
    required this.notice,
  });
  final NoticeEntity notice;
}
