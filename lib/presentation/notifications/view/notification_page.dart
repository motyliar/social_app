import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/notification/notification.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/routers/animation_route.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/domains/notification/entities/notification_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';

import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/app/widgets/loading_state.dart';

import 'package:climbapp/presentation/notifications/business/cubit/fetch_notify_cubit.dart';
import 'package:climbapp/presentation/notifications/widgets/exports.dart';

import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});
  static Route<dynamic> route() {
    return AnimationRoute.slideUpRoute(
        direction: const NotificationPage(), route: routeNotification);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final l10n = context.l10n;
    return BlocProvider(
      create: (context) => userLocator<FetchNotifyCubit>()
        ..getUserNotifications(NotificationParams(
            url: AppUrl.getUserNotificationsURL(user.id), newNotify: {})),
      child: Scaffold(
        backgroundColor: ColorPallete.scaffoldBackground,
        body: BlocBuilder<FetchNotifyCubit, FetchNotifyState>(
          builder: (context, state) {
            if (state is FetchNotifyLoading) {
              return const LoadingPage();
            }
            return SafeArea(
                child: SingleChildScrollView(
              child: Column(children: [
                TopNotifyBar(text: l10n.notification),
                const Gap(kMinEmptySpace),
                const GradientDivider(),
                Column(
                  children: List.generate(
                    state.notifications.length,
                    (index) => Dismissible(
                      key: ValueKey<NotificationEntity>(
                          state.notifications[index]),
                      onDismissed: (DismissDirection direction) => {
                        debugPrint('switch'),
                        context.read<FetchNotifyCubit>().deleteUserNotify(
                            NotificationParams(
                                url: AppUrl.deleteNotifyURL,
                                newNotify: {
                                  "notify": state.notifications[index].id,
                                  "user": user.id
                                }),
                            index),
                      },
                      background: Container(
                        color: ColorPallete.pinkDecorationColor,
                        child: AppIcons.deleteBig.copyWith(color: Colors.black),
                      ),
                      child: SingleNotify(
                        notification: state.notifications[index],
                      ),
                    ),
                  ),
                ),
                const PageEnd()
              ]),
            ));
          },
        ),
      ),
    );
  }
}
