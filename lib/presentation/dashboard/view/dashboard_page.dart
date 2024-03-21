import 'package:climbapp/domains/notice/entities/notice_enums/directions.dart';
import 'package:climbapp/presentation/notice/view/notice_main_page.dart';

import 'package:flutter/material.dart';
import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/dashboard/business/bloc/bloc/fetch_notice_bloc.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/like_icon_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/scroll_visible_control_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/single_notice/fetch_single_notice_cubit.dart';
import 'package:climbapp/presentation/dashboard/widgets/notice/notice_loader.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../widgets/widgets.dart';

const double _floatingButtonWidth = 170;

// todo teraz należy po pobraniu ładnie wyświetlić nasze ogłoszenia
// Better look of notice Loading
// Create Single Notice Page with comments
// User Profile, check fetch and check notice - delete/edit
// filtrowanie
// osobne ogłoszenie

// dodawanie komentarzy : otwieranie okna z komentarzami oraz dodawanie nowych

const double _appBarExpandedHeight = 180;

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  static Route<dynamic> route() {
    return Utils.animatedRoute(
        direction: const DashboardPage(), route: routeDashboardPage);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController noticeController = ScrollController();
    final l10n = context.l10n;
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userLocator<FetchNoticeBloc>()
            ..add(
              FetchNoticesFromDB(
                params: GetNoticeParams(
                  url: AppUrl.noticePaginationURL(1, 2),
                ),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => userLocator<FetchSingleNoticeCubit>()
            ..emitResultOfFetching(GetNoticeParams(
                url: AppUrl.singleNoticeURL("65789782866f56088bd20eac"))),
        ),
        BlocProvider(
            create: (context) => ScrollVisibleControlCubit(noticeController)),
        BlocProvider(create: (context) => LikeIconCubit()),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.scaffoldBackground,
          body: SafeArea(
            child: CustomScrollView(
              controller: noticeController,
              slivers: [
                SliverAppBar(
                  backgroundColor: ColorPallete.scaffoldBackground,
                  automaticallyImplyLeading: false,
                  floating: true,
                  expandedHeight: _appBarExpandedHeight,
                  flexibleSpace: FlexibleSpaceBar(
                    background: DashBoardApp(
                        controller: ScrollController(),
                        imageSrc: user.profileAvatar!,
                        userName: user.userName),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SlidableNavigator(),
                ),
                SliverToBoxAdapter(
                  child: BlocConsumer<ScrollVisibleControlCubit, bool>(
                    listener: (context, state) {
                      if (state == true) {
                        BlocProvider.of<FetchNoticeBloc>(context)
                            .add(FetchNoticesFromDB(
                          params: GetNoticeParams(
                            url: AppUrl.noticePaginationURL(1, 4),
                          ),
                        ));
                      }
                    },
                    builder: (context, state) {
                      return BlocBuilder<FetchNoticeBloc, FetchNoticeState>(
                        builder: (context, state) {
                          if (state is FetchNoticeLoading) {
                            return const NoticeLoader();
                          }

                          return Column(
                            children: [
                              Column(
                                children: List.generate(
                                  state.notices.length,
                                  (index) => NoticeCard(
                                    noticeIndex: index,
                                    notice: state.notices[index],
                                    onTap: () => Navigator.pushNamed(
                                        context, routeNoticePage,
                                        arguments: PageParams(
                                            notice: state.notices[index],
                                            context: context,
                                            index: index)),
                                    logoOnTap: () => context
                                        .read<FetchNoticeBloc>()
                                        .add(UpdateNoticeJoinArrays(
                                            params: UpdateRequestJoinParams(
                                                userId: user.id,
                                                noticeId:
                                                    state.notices[index].id,
                                                direction: Direction.request,
                                                url: AppUrl
                                                    .addIdToJoinArrayURL()),
                                            index: index)),
                                    logoOnTapBack: () => context
                                        .read<FetchNoticeBloc>()
                                        .add(DeleteNoticeJoinID(
                                            params: UpdateRequestJoinParams(
                                                userId: user.id,
                                                noticeId:
                                                    state.notices[index].id,
                                                direction: Direction.request,
                                                url: AppUrl
                                                    .deleteIdToJoinArrayURL()),
                                            index: index)),
                                    userId: user.id,
                                    smileOnTap: () => context
                                        .read<FetchNoticeBloc>()
                                        .add(UpdateNoticeJoinArrays(
                                            params: UpdateRequestJoinParams(
                                                userId: user.id,
                                                noticeId:
                                                    state.notices[index].id,
                                                direction: Direction.interested,
                                                url: AppUrl
                                                    .addIdToJoinArrayURL()),
                                            index: index)),
                                    smileOnTapBack: () => context
                                        .read<FetchNoticeBloc>()
                                        .add(DeleteNoticeJoinID(
                                            params: UpdateRequestJoinParams(
                                                userId: user.id,
                                                noticeId:
                                                    state.notices[index].id,
                                                direction: Direction.interested,
                                                url: AppUrl
                                                    .deleteIdToJoinArrayURL()),
                                            index: index)),
                                  ),
                                ),
                              ),
                              const Gap(20),
                              const GradientDivider(
                                dividerHeight: kMidDividerHeight,
                              ),
                              const Gap(20),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: MidTextButton(
            backgroundGradient: pinkToBlueRoundGradient,
            textLabel: l10n.floatingText,
            textStyle: AppTextStyle.headersBig,
            buttonWidth: _floatingButtonWidth,
            onTap: () => Navigator.popAndPushNamed(context, routeCreateNotice),
          ),
        ),
      ),
    );
  }
}
