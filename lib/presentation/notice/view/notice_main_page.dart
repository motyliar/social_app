import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/presentation/notice/business/cubit/create_notice/create_notice_cubit.dart';
import 'package:climbapp/presentation/notice/business/cubit/fetch_user_notice/fetch_user_notice_cubit.dart';
import 'package:climbapp/presentation/notice/business/cubit/update_notice/update_notice_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoticeMainPage extends StatelessWidget {
  const NoticeMainPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeNoticePage),
      builder: (_) => const NoticeMainPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userLocator<CreateNoticeCubit>(),
        ),
        BlocProvider(
          create: (context) => userLocator<FetchUserNoticeCubit>()
            ..fetchReturnByState(
                GetNoticeParams(url: AppUrl.fetchUserNoticeURL('1111111'))),
        ),
        BlocProvider(
          create: (_) => userLocator<UpdateNoticeCubit>(),
        )
      ],
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('BACK')),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<CreateNoticeCubit, CreateNoticeState>(
              builder: (context, state) {
                return ElevatedButton(
                    onPressed: () => context
                        .read<CreateNoticeCubit>()
                        .sendNewNoticeToServer(CreateNoticeParams.send(
                            AppUrl.createNoticeURL(),
                            NoticeTemplate(
                                author: 'nowy author',
                                authorId: '1111111',
                                category: 'kupie',
                                content: 'content flutter',
                                title: 'new flutter title',
                                price: 23))),
                    child: Text('create notice'));
              },
            ),
            BlocBuilder<FetchUserNoticeCubit, FetchUserNoticeState>(
              builder: (context, state) {
                if (state is FetchUserNoticeLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is FetchUserNoticeFailed) {
                  return Center(
                    child: Text('Fetch failed'),
                  );
                }
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: ListView.builder(
                    itemCount: state.userNotices.length,
                    itemBuilder: (context, index) {
                      return Text(state.userNotices[index].createdAt);
                    },
                  ),
                );
              },
            )
          ],
        ))),
      ),
    );
  }
}
