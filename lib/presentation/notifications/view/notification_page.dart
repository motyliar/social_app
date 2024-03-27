import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/routers/animation_route.dart';
import 'package:climbapp/domains/notification/entities/sub_entity/notify_type.dart';
import 'package:climbapp/presentation/notice/widgets/widgets.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  static Route<dynamic> route() {
    return AnimationRoute.slideUpRoute(
        direction: const NotificationPage(), route: routeNotification);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
            children: List.generate(
          4,
          (index) => const SingleNotify(
            type: NewRequests(author: 'Marcin'),
          ),
        )),
      )),
    );
  }
}

class SingleNotify extends StatelessWidget {
  const SingleNotify({
    required this.type,
    super.key,
  });

  final NotifyType type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: GeneralCard(children: [
        Row(
          children: [
            const ProfileAvatar(url: ''),
            Text(type.notifyText(context))
          ],
        )
      ]),
    );
  }
}
