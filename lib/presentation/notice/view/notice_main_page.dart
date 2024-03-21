import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/domains/notice/entities/notice_enums/directions.dart';
import 'package:climbapp/presentation/dashboard/business/bloc/bloc/fetch_notice_bloc.dart';
import 'package:climbapp/presentation/dashboard/widgets/notice/notice_card.dart';
import 'package:climbapp/presentation/notice/business/cubit/create_notice/create_notice_cubit.dart';
import 'package:climbapp/presentation/notice/business/cubit/delete_notice/delete_notice_cubit.dart';

import 'package:climbapp/presentation/notice/business/cubit/update_notice/update_notice_cubit.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageParams {
  const PageParams(
      {required this.notice, required this.context, required this.index});
  final NoticeEntity notice;
  final BuildContext context;
  final int index;
}

class NoticeMainPage extends StatelessWidget {
  const NoticeMainPage(
      {required this.notice,
      required this.contex,
      required this.index,
      super.key});
  static Route<dynamic> route(PageParams params) {
    return Utils.animatedRoute(
        direction: NoticeMainPage(
          notice: params.notice,
          contex: params.context,
          index: params.index,
        ),
        route: routeNoticePage);
  }

  final NoticeEntity notice;
  final BuildContext contex;
  final int index;

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userLocator<CreateNoticeCubit>(),
        ),
        BlocProvider(
          create: (_) => userLocator<UpdateNoticeCubit>(),
        ),
        BlocProvider(create: (_) => userLocator<DeleteNoticeCubit>()),
        BlocProvider(create: (contex) => userLocator<FetchNoticeBloc>())
      ],
      child: Scaffold(
        backgroundColor: ColorPallete.scaffoldBackground,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('back'),
              ),
              NoticeCard(
                noticeIndex: index,
                notice: notice,
                logoOnTap: () => contex.read<FetchNoticeBloc>().add(
                    UpdateNoticeJoinArrays(
                        params: UpdateRequestJoinParams(
                            userId: user.id,
                            noticeId: notice.id,
                            direction: Direction.request,
                            url: AppUrl.addIdToJoinArrayURL()),
                        index: index)),
                logoOnTapBack: () => contex.read<FetchNoticeBloc>().add(
                    DeleteNoticeJoinID(
                        params: UpdateRequestJoinParams(
                            userId: user.id,
                            noticeId: notice.id,
                            direction: Direction.request,
                            url: AppUrl.deleteIdToJoinArrayURL()),
                        index: index)),
                userId: user.id,
                smileOnTap: () => contex.read<FetchNoticeBloc>().add(
                    UpdateNoticeJoinArrays(
                        params: UpdateRequestJoinParams(
                            userId: user.id,
                            noticeId: notice.id,
                            direction: Direction.interested,
                            url: AppUrl.addIdToJoinArrayURL()),
                        index: index)),
                smileOnTapBack: () => contex.read<FetchNoticeBloc>().add(
                    DeleteNoticeJoinID(
                        params: UpdateRequestJoinParams(
                            userId: user.id,
                            noticeId: notice.id,
                            direction: Direction.interested,
                            url: AppUrl.deleteIdToJoinArrayURL()),
                        index: index)),
              ),
            ],
          ),
        )),
      ),
    );
  }
}



// Column(
//           children: [
//             ElevatedButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 child: const Text('BACK')),
//             const SizedBox(
//               height: 20,
//             ),
//             BlocBuilder<CreateNoticeCubit, CreateNoticeState>(
//               builder: (context, state) {
//                 return ElevatedButton(
//                     onPressed: () => context
//                         .read<CreateNoticeCubit>()
//                         .sendNewNoticeToServer(CreateNoticeParams.send(
//                             AppUrl.createNoticeURL(), <String, dynamic>{})),
//                     child: const Text('create notice'));
//               },
//             ),
//             BlocBuilder<FetchUserNoticeCubit, FetchUserNoticeState>(
//               builder: (context, state) {
//                 if (state is FetchUserNoticeLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 if (state is FetchUserNoticeFailed) {
//                   return const Center(
//                     child: Text('Fetch failed'),
//                   );
//                 }
//                 return SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   height: 100,
//                   child: ListView.builder(
//                     itemCount: state.userNotices.length,
//                     itemBuilder: (context, index) {
//                       return Column(children: [
//                         Text(state.userNotices[index].author),
//                         Text(state.userNotices[index].comments != null
//                             ? state.userNotices[index].comments!.length
//                                 .toString()
//                             : 'no comment'),
//                       ]);
//                     },
//                   ),
//                 );
//               },
//             ),
//             BlocConsumer<UpdateNoticeCubit, UpdateNoticeState>(
//               listener: (context, state) {
//                 if (state is UpdateNoticeSuccess) {
//                   Utils.customSnackBarWarning(
//                       context: context, message: 'Success');
//                 }
//                 if (state is UpdateNoticeFailed) {
//                   Utils.customSnackBarWarning(
//                       context: context, message: "failed");
//                 }
//               },
//               builder: (context, state) {
//                 return BlocBuilder<UpdateNoticeCubit, UpdateNoticeState>(
//                   builder: (context, state) {
//                     return ElevatedButton(
//                         onPressed: () => context
//                             .read<UpdateNoticeCubit>()
//                             .updateNotice(UpdateNoticeParams<String>(
//                                 field: 'content.title',
//                                 update: 'Kardashian',
//                                 url: AppUrl.updateSingleNoticeURL(
//                                     "65789782866f56088bd20eac"))),
//                         child: const Text('UPDATE'));
//                   },
//                 );
//               },
//             ),
//             BlocConsumer<DeleteNoticeCubit, DeleteNoticeState>(
//               listener: (context, state) {
//                 if (state is DeleteNoticeFailed) {
//                   Utils.customSnackBarWarning(
//                       context: context, message: 'failed');
//                 }
//                 if (state is DeleteNoticeSuccess) {
//                   Utils.customSnackBarWarning(
//                       context: context, message: 'success');
//                 }
//               },
//               builder: (context, state) {
//                 return BlocBuilder<DeleteNoticeCubit, DeleteNoticeState>(
//                     builder: (context, state) => ElevatedButton(
//                         onPressed: () => context.read<DeleteNoticeCubit>()
//                           ..deleteNotice(GetNoticeParams(
//                               url: AppUrl.deleteSingleNoticeURL(
//                                   "6578a4bd4f0b4bb506fb1b3b"))),
//                         child: const Text('delete')));
//               },
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             ElevatedButton(
//                 onPressed: () => Navigator.pushNamed(context, routeCommentPage),
//                 child: const Text('go to comment')),
//           ],
//         )
