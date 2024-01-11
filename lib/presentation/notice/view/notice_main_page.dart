import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/presentation/notice/business/cubit/create_notice_cubit.dart';
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
    return BlocProvider(
      create: (context) => userLocator<CreateNoticeCubit>(),
      child: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
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
        ],
      ))),
    );
  }
}
