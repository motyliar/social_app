import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/domains/notice/entities/sub_entity/sub_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/open_close_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/logic/notice_logic.dart';
import 'package:climbapp/presentation/dashboard/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AnimatedComment extends StatelessWidget {
  const AnimatedComment(
      {required this.open,
      required this.close,
      required this.comments,
      required this.userId,
      required this.noticeId,
      required this.noticeIndex,
      super.key});

  final Widget open;
  final Widget close;
  final List<CommentsEntity> comments;
  final String userId;
  final String noticeId;
  final int noticeIndex;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocProvider(
        create: (context) => OpenCloseCubit()..changeVisible(change: false),
        child: BlocBuilder<OpenCloseCubit, bool>(
          builder: (context, state) {
            return state
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HeadersSmallText(text: l10n.commentText),
                            TextButton(
                                onPressed: () => context
                                    .read<OpenCloseCubit>()
                                    .changeVisible(),
                                child: const Icon(
                                  Icons.close,
                                  color: ColorPallete.mainDecorationColor,
                                ))
                          ],
                        ),
                        const Divider(),
                        Column(
                          children: comments.isNotEmpty
                              ? List.generate(
                                  comments.length,
                                  (index) => SingleComment(
                                    commentIndex: index,
                                    noticeIndex: noticeIndex,
                                    comment: comments[index],
                                    isUserComment:
                                        NoticeLogic.checkIsUserComment(
                                            comments[index].userId, userId),
                                    noticeId: noticeId,
                                  ),
                                )
                              : [],
                        ),
                        const Gap(5),
                      ])
                : Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () =>
                            context.read<OpenCloseCubit>().changeVisible(),
                        child: close),
                  );
          },
        ));
  }
}
