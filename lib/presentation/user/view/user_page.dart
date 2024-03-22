import 'dart:math';

import 'package:climbapp/core/constans/export_constans.dart';

import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';

import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';

import 'package:climbapp/presentation/friends/business/bloc/friends_action_bloc.dart';
import 'package:climbapp/presentation/notice/business/cubit/fetch_user_notice/fetch_user_notice_cubit.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/business/cubit/view_switch/view_switch_cubit.dart';
import 'package:climbapp/presentation/user/business/enum.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

const double _generalPagePadding = kGeneralPagesMargin;
const double _oneNoticeHeight = 38.0;

class UserPage extends StatelessWidget {
  const UserPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeUserPage),
      builder: (_) => const UserPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final l10n = context.l10n;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userLocator<FriendsActionBloc>()
            ..add(FetchFriendsListEvent(
                params: GetFriendsParams(userId: user.id))),
        ),
        BlocProvider(
          create: (context) => userLocator<FetchUserNoticeCubit>()
            ..fetchReturnByState(
                GetNoticeParams(url: AppUrl.fetchUserNoticeURL(user.id))),
        ),
      ],
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoaded) {
            return Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: kMidEmptySpace,
                  ),
                  BlocBuilder<ViewSwitchCubit, ViewSwitchState>(
                    builder: (context, state) {
                      return BigButtonCard(
                        text: l10n.editLabel,
                        l10n: l10n,
                        onTap: () => context
                            .read<ViewSwitchCubit>()
                            .changeStatus(ViewStatus.info),
                      );
                    },
                  ),
                  const GradientDivider(
                    dividerHeight: kMidDividerHeight,
                  ),
                  generateInformationCard(context, l10n, state),
                  const GradientDivider(
                    dividerHeight: kMidDividerHeight,
                  ),
                  BigButtonCard(
                    text: l10n.favouriteSports,
                    l10n: l10n,
                    onTap: () => BlocProvider.of<ViewSwitchCubit>(context)
                        .changeStatus(ViewStatus.sport),
                  ),
                  const GradientDivider(
                    dividerHeight: kMidDividerHeight,
                  ),
                  UserFriendsCard(l10n: l10n),
                  const GradientDivider(
                    dividerHeight: kMidDividerHeight,
                  ),
                  ContainerTemplate(
                    borderRadius: kMinBorderRadius,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                      right: _generalPagePadding,
                      left: _generalPagePadding,
                    ),
                    color: ColorPallete.whiteOpacity80,
                    padding: const EdgeInsets.all(_generalPagePadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              l10n.activeNotices,
                              style: AppTextStyle.headersSmall,
                            ),
                            Text(
                              '${l10n.totalNotices} ${context.select((FetchUserNoticeCubit cubit) => cubit.state.userNotices.length)}',
                              style: AppTextStyle.descriptionSmall,
                            )
                          ],
                        ),
                        const Divider(),
                        BlocBuilder<FetchUserNoticeCubit, FetchUserNoticeState>(
                          builder: (context, state) {
                            return Column(
                                children: List.generate(
                              state.userNotices.length,
                              (index) => SingleNoticeInformationPreview(
                                notice: state.userNotices[index],
                                l10n: l10n,
                              ),
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                  const GradientDivider(
                    dividerHeight: 15,
                    bottomMargin: _generalPagePadding,
                  ),
                ],
              ),
            );
          } else {
            return const Text('to tutaj');
          }
        },
      ),
    );
  }
}

class SingleNoticeInformationPreview extends StatelessWidget {
  const SingleNoticeInformationPreview({
    super.key,
    required this.notice,
    required this.l10n,
    required this.onDelete,
    required this.onEdit,
  });

  final NoticeEntity notice;
  final AppLocalizations l10n;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const ScrollMotion(), children: [
        Container(
          width: 120,
          height: 50,
          decoration: const BoxDecoration(
            color: ColorPallete.pinkDecorationColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(kSmallButtonBorderRadius),
              bottomRight: Radius.circular(
                kSmallButtonBorderRadius,
              ),
            ),
          ),
          child: Row(
            children: [
              const Gap(kMinEmptySpace),
              AppIcons.deleteBig,
              const Gap(kMinEmptySpace),
              HeadersSmallText(text: l10n.deleteButton.toUpperCase()),
            ],
          ),
        ),
      ]),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          Container(
            width: 120,
            height: 50,
            decoration: const BoxDecoration(
              color: ColorPallete.mainDecorationColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kSmallButtonBorderRadius),
                bottomLeft: Radius.circular(
                  kSmallButtonBorderRadius,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                HeadersSmallText(text: l10n.editText.toUpperCase()),
                const Gap(kMinEmptySpace),
                AppIcons.editBig,
                const Gap(kMinEmptySpace),
              ],
            ),
          ),
          Container(
            width: 120,
            height: 50,
            decoration: const BoxDecoration(
              color: ColorPallete.pinkDecorationColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(kSmallButtonBorderRadius),
                bottomRight: Radius.circular(
                  kSmallButtonBorderRadius,
                ),
              ),
            ),
            child: Row(
              children: [
                const Gap(kMinEmptySpace),
                AppIcons.deleteBig,
                const Gap(kMinEmptySpace),
                HeadersSmallText(text: l10n.deleteButton.toUpperCase()),
              ],
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                notice.content.title.capitalize(),
                style: AppTextStyle.descriptionBig
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Gap(kMinEmptySpace),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                notice.category.name.toUpperCase(),
                style: AppTextStyle.descriptionSmall,
              ),
              Row(
                children: [
                  Text(
                    '${l10n.commentText} ${notice.comments?.length}',
                    style: AppTextStyle.descriptionSmall,
                  ),
                  const SizedBox(
                    width: kMinEmptySpace,
                  ),
                ],
              ),
            ],
          ),
          const Gap(kMinEmptySpace),
        ],
      ),
    );
  }
}
