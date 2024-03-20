import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/domains/notice/entities/sub_entity/sub_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/dashboard/business/bloc/bloc/fetch_notice_bloc.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/open_close_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/deleteComment/delete_comment_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/logic/notice_logic.dart';

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
                            const HeadersSmallText(text: 'Comments'),
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

class SingleComment extends StatelessWidget {
  const SingleComment({
    super.key,
    required this.comment,
    required this.isUserComment,
    required this.noticeId,
    required this.noticeIndex,
    required this.commentIndex,
  });

  final CommentsEntity comment;
  final bool isUserComment;
  final String noticeId;
  final int commentIndex;
  final int noticeIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userLocator<DeleteCommentCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.popAndPushNamed(
                        context, routeProfilePage,
                        arguments: FriendsEntity(
                            id: comment.userId,
                            userName: comment.user,
                            profileAvatar: comment.avatar,
                            isActive: true,
                            lastLoggedIn: '')),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(comment.avatar),
                    ),
                  ),
                  const Gap(5),
                  Text(
                    comment.user,
                    style: AppTextStyle.descriptionBigL
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                comment.createdAt.isTooLong(16),
                style: AppTextStyle.descriptionMid,
              ),
            ],
          ),
          const Gap(3),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: ColorPallete.mainDecorationColor.withOpacity(0.3)),
              child: Text(
                comment.content.capitalize(),
                style: AppTextStyle.descriptionBigL,
              ),
            ),
          ),
          Visibility(
              visible: isUserComment,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BlocBuilder<DeleteCommentCubit, DeleteCommentState>(
                    builder: (context, state) {
                      return TextButton(
                          onPressed: () => context
                              .read<DeleteCommentCubit>()
                              .deleteComment(GetNoticeParams(
                                  url: AppUrl.deleteCommentFromNotice(
                                      comment.id),
                                  noticeId: noticeId))
                              .whenComplete(() =>
                                  BlocProvider.of<FetchNoticeBloc>(context).add(
                                      DeleteComment(
                                          index: noticeIndex,
                                          commentIndex: commentIndex))),
                          child: AppIcons.delete);
                    },
                  ),
                  const Gap(5),
                  AppIcons.edit,
                ],
              )),
          const Gap(3),
        ],
      ),
    );
  }
}
