import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/notice/widgets/back_card.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SingleUserNotice extends StatelessWidget {
  const SingleUserNotice({required this.notice, super.key});
  static Route<dynamic> route({required SingleNoticeParams params}) {
    return Utils.animatedRoute(
        direction: SingleUserNotice(
          notice: params.notice,
        ),
        route: routeSingleUserNotice);
  }

  final NoticeEntity notice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BackCard(
              onBack: () {
                Navigator.pop(context);
              },
            ),
            const GeneralCard(children: [
              HeadersSmallText(text: 'Edit'),
            ]),
          ],
        ),
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
