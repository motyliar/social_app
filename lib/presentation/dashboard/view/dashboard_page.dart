import 'package:climbapp/presentation/user/widgets/widgets.dart';
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
// zaimplementować paginację
// filtrowanie
// osobne ogłoszenie
// dodawanie join/requestów
// dodawanie komentarzy
// dodawanie lików do ogłoszenia

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  static Route<dynamic> route() {
    return Utils.animatedRoute(
        direction: const DashboardPage(), route: routeDashboardPage);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    final l10n = context.l10n;
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userLocator<FetchNoticeBloc>()
            ..add(
              FetchNoticesFromDB(
                params: GetNoticeParams(
                  url: AppUrl.noticePaginationURL(1, 12),
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
            create: (context) => ScrollVisibleControlCubit(scrollController)),
        BlocProvider(create: (context) => LikeIconCubit()),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.scaffoldBackground,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: ColorPallete.scaffoldBackground,
                  automaticallyImplyLeading: false,
                  floating: true,
                  expandedHeight: 180,
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
                  child: BlocBuilder<FetchNoticeBloc, FetchNoticeState>(
                    builder: (context, state) {
                      if (state is FetchNoticeLoading) {
                        return const NoticeLoader();
                      }
                      return Column(
                        children: [
                          Column(
                            children: List.generate(
                              state.notices.length,
                              (index) => GeneralCard(children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            state.notices[index].avatar)),
                                    Column(
                                      children: [
                                        Text(
                                            state.notices[index].content.title),
                                        Text(
                                            state.notices[index].localization!),
                                        Text(
                                            state.notices[index].content.when ??
                                                ''),
                                      ],
                                    ),
                                    CircleAvatar(
                                      radius: 5,
                                      backgroundColor:
                                          state.notices[index].isActive
                                              ? ColorPallete.greenActiveColor
                                              : ColorPallete
                                                  .greyShadowColorOpacityMax,
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Text(state.notices[index].content.content),
                                const GradientDivider(),
                                Row(
                                  children: [
                                    const AppLogoButton(),
                                    LikeActionButton(
                                      onTap: () => Utils.giveLike(
                                        context,
                                        context.select((LikeIconCubit cubit) =>
                                            cubit.state),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
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
            textStyle: AppTextStyle.headersBigger,
            buttonWidth: _floatingButtonWidth,
            onTap: () => Navigator.popAndPushNamed(context, routeCreateNotice),
          ),
        ),
      ),
    );
  }
}
