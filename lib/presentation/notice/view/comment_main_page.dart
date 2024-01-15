import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/presentation/notice/business/cubit/add_comment/add_comment_cubit.dart';
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
    return BlocProvider(
      create: (context) => userLocator<AddCommentCubit>(),
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
                    child: Text('ADD NEW COMMENT'));
              },
            ),
          ],
        )),
      ),
    );
  }
}
