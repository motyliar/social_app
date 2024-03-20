import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/add_comment/add_comment_cubit.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';

class NoticeLogic {
  static bool didIClick(Set<String> idsList, String userId) {
    for (var likes in idsList) {
      if (likes == userId) {
        return true;
      }
    }
    return false;
  }

  static addCommentSheet(
    BuildContext context,
    TextEditingController controller,
    NoticeEntity notice,
  ) {
    final l10n = context.l10n;
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => AddComment(
        l10n: l10n,
        controller: controller,
        notice: notice,
      ),
    ).whenComplete(() => controller.clear());
  }
}

class AddComment extends StatelessWidget {
  const AddComment({
    super.key,
    required this.l10n,
    required this.controller,
    required this.notice,
  });

  final AppLocalizations l10n;
  final TextEditingController controller;
  final NoticeEntity notice;

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return BlocProvider(
      create: (context) => userLocator<AddCommentCubit>(),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.only(
              right: kGeneralPagesMargin,
              left: kGeneralPagesMargin,
              top: kGeneralPagesMargin),
          width: MediaQuery.of(context).size.width,
          height: 250,
          decoration: const BoxDecoration(
            color: ColorPallete.whiteOpacity60,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kMinBorderRadius),
              topRight: Radius.circular(kMinBorderRadius),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notice.content.title,
                style: AppTextStyle.headersSmall,
              ),
              const Divider(),
              TextFormField(
                  style: AppTextStyle.descriptionBig,
                  minLines: 3,
                  maxLines: 100,
                  controller: controller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: l10n.commentHint,
                      hintStyle: AppTextStyle.descriptionMid)),
              Align(
                alignment: Alignment.bottomRight,
                child: BlocBuilder<AddCommentCubit, AddCommentState>(
                  builder: (context, state) {
                    return MidTextButton(
                      onTap: () => context
                          .read<AddCommentCubit>()
                          .addNewComment(
                            CreateNoticeCommentsParams(
                              comment: CommentTemplate(
                                user: user.userName,
                                userId: user.id,
                                content: controller.text,
                              ),
                              url: AppUrl.addCommentToNotice(
                                notice.id,
                              ),
                            ),
                          )
                          .then((value) => {
                                controller.clear(),
                                Navigator.of(context).pop()
                              }),
                      textLabel: l10n.addComment,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
