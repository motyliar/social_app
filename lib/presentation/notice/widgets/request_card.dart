import 'package:climbapp/core/constans/notify_type_con.dart';
import 'package:climbapp/core/datahelpers/params/notification/notification.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/domains/requests/entities/requests_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/notice/business/cubit/request_resolve/request_resolve_cubit.dart';
import 'package:climbapp/presentation/notice/business/logic/notice_logic.dart';
import 'package:climbapp/presentation/notice/view/single_user_notice.dart';
import 'package:climbapp/presentation/notice/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../../core/constans/export_constans.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({
    required this.user,
    required this.params,
    required this.resolutions,
    super.key,
  });

  final RequestsEntity user;
  final ThumbsActionParams params;
  final Set<String> resolutions;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userLocator<RequestResolveCubit>(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ProfileAvatar(
                url: user.avatar,
                radius: 25,
              ),
              const Gap(kGeneralPagesMargin),
              HeadersSmallText(text: user.userName),
            ],
          ),
          BlocBuilder<RequestResolveCubit, RequestResolveState>(
            builder: (context, state) {
              return isResolve(resolutions, user.id)
                  ? const ResolvedThumbs()
                  : Thumbs(
                      thumbUp: () =>
                          context.read<RequestResolveCubit>().resolveRequest(
                                NotificationParams(
                                  url: AppUrl.resolveRequestURL,
                                  newNotify: NoticeLogic.createResolveMap(
                                    isPositive: true,
                                    userId: user.id,
                                    event: params.noticeId,
                                    author: params.userId,
                                    avatar: params.userAvatar,
                                    category: NotifyTypeCons.resolve,
                                    authorName: params.userName,
                                  ),
                                ),
                              ),
                      thumbDown: () =>
                          context.read<RequestResolveCubit>().resolveRequest(
                                NotificationParams(
                                  url: AppUrl.resolveRequestURL,
                                  newNotify: NoticeLogic.createResolveMap(
                                    isPositive: false,
                                    userId: user.id,
                                    event: params.noticeId,
                                    author: params.userId,
                                    avatar: params.userAvatar,
                                    category: NotifyTypeCons.resolve,
                                    authorName: params.userName,
                                  ),
                                ),
                              ),
                    );
            },
          ),
        ],
      ),
    );
  }
}

bool isResolve(Set<String> resolutions, String user) {
  return resolutions.contains(user);
}
