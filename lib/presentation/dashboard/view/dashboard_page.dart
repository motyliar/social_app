import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/presentation/app/business/cubit/theme/theme_cubit.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/app/widgets/loading_state.dart';
import 'package:climbapp/presentation/dashboard/business/bloc/bloc/fetch_notice_bloc.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/like_icon_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/scroll_visible_control_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/slidable_menu_cubit.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/single_notice/fetch_single_notice_cubit.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../widgets/widgets.dart';

const double _floatingButtonWidth = 170;

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeDashboardPage),
      builder: (_) => const DashboardPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    ScrollController listViewController = ScrollController();
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
          appBar: DashboardAppBar(
            controller: scrollController,
            mainChild: BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserLoaded) {
                  context.read<ThemeCubit>().changeThemeData(
                        mode: state.user.preferences?.mode ?? false,
                      );
                }
              },
              builder: (context, state) {
                return BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                  if (state is UserLoading) {
                    return const LoadingPage();
                  }
                  if (state is UserLoaded) {
                    context.read<ThemeCubit>().changeThemeData(
                          mode: state.user.preferences?.mode ?? false,
                        );
                    return DashBoardApp(
                        controller: scrollController,
                        imageSrc: state.user.profileAvatar!,
                        userName: state.user.userName);
                  }
                  return const Text('failed');
                });
              },
            ),
          ),
          body: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SlidableNavigator(),
                      Flexible(
                        fit: FlexFit.loose,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          controller: listViewController,
                          itemCount: 3,
                          itemBuilder: (context, index) => const SingleNotice(),
                        ),
                      ),
                      const Gap(20),
                      const GradientDivider(
                        dividerHeight: kMidDividerHeight,
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
                // Todo Right menu is hiding before will have implemented logic
                // RightOnScreenMenu(
                //   menus: List.generate(
                //       3,
                //       (index) => SlidableMenu(
                //           icon: Icons.settings,
                //           windowName: kSlidableNameList[index])),
                // ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const MidTextButton(
            backgroundGradient: pinkToBlueRoundGradient,
            textLabel: 'Add Notice',
            textStyle: AppTextStyle.headersBigger,
            buttonWidth: 170,
          ),
        ),
      ),
    );
  }
}
