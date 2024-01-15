import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/presentation/notice/business/cubit/add_comment/add_comment_cubit.dart';
import 'package:climbapp/presentation/notice/business/cubit/deleteComment/delete_comment_cubit.dart';
import 'package:climbapp/presentation/notice/business/cubit/update_comment/update_comment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentMainPage extends StatelessWidget {
  const CommentMainPage({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeCommentPage),
        builder: (_) => const CommentMainPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userLocator<AddCommentCubit>(),
        ),
        BlocProvider(
          create: (context) => userLocator<DeleteCommentCubit>(),
        ),
        BlocProvider(create: (context) => userLocator<UpdateCommentCubit>()),
      ],
      child: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('go back')),
            BlocBuilder<AddCommentCubit, AddCommentState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<AddCommentCubit>().addNewComment(
                        CreateNoticeCommentsParams(
                            comment: CommentTemplate(
                              user: 'BRONEK',
                              userId: '111111',
                              content: 'Świetna zabawa',
                            ),
                            url: AppUrl.addCommentToNotice(
                                '65789782866f56088bd20eac')));
                  },
                  child: Text(
                    'ADD NEW COMMENT',
                  ),
                );
              },
            ),
            BlocBuilder<DeleteCommentCubit, DeleteCommentState>(
                builder: (context, state) {
              return ElevatedButton(
                  onPressed: () =>
                      context.read<DeleteCommentCubit>().deleteComment(
                            GetNoticeParams(
                              url: AppUrl.deleteCommentFromNotice(
                                  "6578a138b987d2e1cf37b635"),
                              noticeId: "65789782866f56088bd20eac",
                            ),
                          ),
                  child: Text('Delete Comment'));
            }),
            BlocBuilder<UpdateCommentCubit, UpdateCommentState>(
                builder: ((context, state) {
              return ElevatedButton(
                  onPressed: () =>
                      context.read<UpdateCommentCubit>().updateSingleComment(
                            UpdateCommentParams(
                              commentId: "65a51bc01e84e7e0b1676d0d",
                              newContent: "rewelacyjne widoki",
                              url: AppUrl.updateCommentURL(
                                "65789782866f56088bd20eac",
                              ),
                            ),
                          ),
                  child: Text('update comment'));
            }))
          ],
        )),
      ),
    );
  }
}
