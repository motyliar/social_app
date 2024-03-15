import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/business/cubit/theme/theme_cubit.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/app/widgets/loading_state.dart';
import 'package:climbapp/presentation/dashboard/business/bloc/bloc/fetch_notice_bloc.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/like_icon_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/scroll_visible_control_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/slidable_menu_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/single_notice/fetch_single_notice_cubit.dart';
import 'package:climbapp/presentation/message/widgets/widgets.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../widgets/widgets.dart';

const double _floatingButtonWidth = 170;

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  static Route<dynamic> route() {
    return Utils.animatedRoute(
        direction: const DashboardPage(), route: routeDashboardPage);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    ScrollController listViewController = ScrollController();
    final l10n = context.l10n;
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userLocator<FetchNoticeBloc>()
            ..add(
              FetchNoticesFromDB(
                params: GetNoticeParams(
                  url: AppUrl.noticePaginationURL(1, 4),
                ),
              ),
            ),
        ),
        BlocProvider(
          create: (context) => userLocator<FetchSingleNoticeCubit>()
            ..emitResultOfFetching(GetNoticeParams(
                url: AppUrl.singleNoticeURL("65789782866f56088bd20eac"))),
        ),
        BlocProvider(create: (context) => SlidableMenuCubit()),
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
                  child: Column(
                    children: [
                      Column(
                        children: List.generate(
                          4,
                          (index) => const SingleNotice(),
                        ),
                      ),
                      const Gap(20),
                      const GradientDivider(
                        dividerHeight: kMidDividerHeight,
                      ),
                      const Gap(20),
                    ],
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
