// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:climbapp/presentation/app/widgets/top_notify_bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/requests/requests_params.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/notice/business/cubit/fetch_requested_users/fetch_requested_users_cubit.dart';
import 'package:climbapp/presentation/notice/widgets/widgets.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';

// todo
// dodać implementację notification i wtedy mamy już praktycznie wszystko,
// do Notice należy dodać Bool - resolve? żeby można było sprawdzić
// czy problem został rozwiązany
// edycja własnej notatki

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
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return BlocProvider(
      create: (context) => userLocator<FetchRequestedUsersCubit>()
        ..fetchUsers(RequestsParams(
            userList: notice.requests != null ? notice.requests!.toList() : [],
            url: AppUrl.getRequestedURL)),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                TopNotifyBar(text: l10n.notice),
                const Gap(kMidEmptySpace),
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
                                text:
                                    notice.interested?.length.toString() ?? '0')
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
                      HeadersSmallText(text: l10n.requests),
                      HeadersSmallText(
                          text: notice.requests?.length.toString() ?? '0'),
                    ],
                  ),
                  const GradientDivider(),
                  const Gap(kMidEmptySpace),
                  BlocBuilder<FetchRequestedUsersCubit,
                      FetchRequestedUsersState>(
                    builder: (context, state) {
                      return Column(
                          children: List.generate(
                        state.users.length,
                        (index) => RequestCard(
                          resolutions: notice.resolutions,
                          user: state.users[index],
                          params: ThumbsActionParams(
                            userName: user.userName,
                            userAvatar: user.profileAvatar!,
                            noticeId: notice.id,
                            userId: user.id,
                          ),
                        ),
                      ));
                    },
                  )
                ]),
                const PageEnd(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// [ThumbsActionParams] are using for handling params to send Resolve to Notice
class ThumbsActionParams {
  final String userName;
  final String userAvatar;
  final String noticeId;
  final String userId;
  ThumbsActionParams({
    required this.userName,
    required this.userAvatar,
    required this.noticeId,
    required this.userId,
  });
}

class SingleNoticeParams {
  const SingleNoticeParams({
    required this.notice,
  });
  final NoticeEntity notice;
}
