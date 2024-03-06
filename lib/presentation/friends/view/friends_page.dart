import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/core/constans/export_constans.dart';

import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/friends/business/bloc/friends_action_bloc.dart';
import 'package:climbapp/presentation/friends/business/cubit/cubit/search_option_cubit.dart';
import 'package:climbapp/presentation/friends/business/cubit/search_visible/search_visible_cubit.dart';
import 'package:climbapp/presentation/friends/widgets/widgets.dart';
import 'package:climbapp/presentation/profile/view/profile_page.dart';

import 'package:climbapp/presentation/profile/widgets/widgets.dart';
import 'package:climbapp/presentation/sign_in/widgets/text_form_field.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//todo zrobić last search list w temp

TextEditingController _searchController = TextEditingController();
ScrollController _pageScrollController = ScrollController();
ScrollController _friendsController = ScrollController();
ScrollController _searchSqrController = ScrollController();

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeFriendsPage),
      builder: (_) => const FriendsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userLocator<FriendsActionBloc>()
            ..add(FetchFriendsListEvent(
                params: GetFriendsParams(userId: user.id))),
        ),
        BlocProvider(
          create: (context) => SearchVisibleCubit(),
        ),
        BlocProvider(create: (context) => SearchOptionCubit()),
      ],
      child: Scaffold(
        backgroundColor: ColorPallete.scaffoldBackground,
        body: SafeArea(
            child: SingleChildScrollView(
          controller: _pageScrollController,
          child: Column(
            children: [
              const LitlleTopBar(),
              BlocBuilder<SearchVisibleCubit, bool>(
                builder: (context, isVisible) {
                  return UserViewCard(children: [
                    GestureDetector(
                      onTap: () =>
                          context.read<SearchVisibleCubit>().changeVisible(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const HeadersSmallText(text: 'Find someone'),
                          Icon(
                            isVisible ? Icons.remove : Icons.add,
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: Column(
                        children: [
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ContainerTemplate(
                                padding:
                                    const EdgeInsets.only(left: kMidEmptySpace),
                                borderRadius: kSmallButtonBorderRadius,
                                color: ColorPallete.whiteOpacity60,
                                width: Utils.sizeCalculator(
                                    totalDimension:
                                        MediaQuery.of(context).size.width,
                                    multipler: 0.5),
                                child: CTextFormField(
                                  enableBorders: false,
                                  controller: _searchController,
                                  hintText: 'find friend',
                                ),
                              ),
                              BlocBuilder<FriendsActionBloc,
                                  FriendsActionState>(
                                builder: (context, state) {
                                  return BlocBuilder<SearchOptionCubit, bool>(
                                    builder: (context, isMy) {
                                      return MidTextButton(
                                          textStyle:
                                              AppTextStyle.descriptionSmall,
                                          margin:
                                              const EdgeInsets.only(left: 5),
                                          onTap: () => _searchController
                                                  .text.isEmpty
                                              ? null
                                              : isMy
                                                  ? context
                                                      .read<FriendsActionBloc>()
                                                      .add(SearchFromListEvent(
                                                          _searchController
                                                              .text))
                                                  : context
                                                      .read<FriendsActionBloc>()
                                                      .add(
                                                        SearchForUsersEvent(
                                                          userByName:
                                                              _searchController
                                                                  .text,
                                                        ),
                                                      ),
                                          textLabel: 'Search');
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          BlocBuilder<SearchOptionCubit, bool>(
                            builder: (context, isMy) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  MidTextButton(
                                    onTap: () => isMy
                                        ? null
                                        : context
                                            .read<SearchOptionCubit>()
                                            .changeSearchOption(),
                                    buttonHeight: 30,
                                    textLabel: 'Only my',
                                    textStyle: AppTextStyle.descriptionSmall,
                                    backgroundGradient: isMy
                                        ? pinkToBlueRoundGradient
                                        : greyNeutralGradient,
                                  ),
                                  MidTextButton(
                                    onTap: () => isMy
                                        ? context
                                            .read<SearchOptionCubit>()
                                            .changeSearchOption()
                                        : null,
                                    buttonHeight: 30,
                                    textLabel: 'Look global',
                                    textStyle: AppTextStyle.descriptionSmall,
                                    backgroundGradient: isMy
                                        ? greyNeutralGradient
                                        : pinkToBlueRoundGradient,
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ]);
                },
              ),
              const GradientDivider(
                dividerHeight: kMidDividerHeight,
              ),
              BlocBuilder<FriendsActionBloc, FriendsActionState>(
                  builder: (context, blocstate) {
                if (blocstate is FriendsActionInitial) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (blocstate is FriendsSearchingSuccess) {
                  print(blocstate.friend.length);
                  return RefreshIndicator(
                    onRefresh: () async => context.read<FriendsActionBloc>()
                      ..add(FetchFriendsListEvent(
                          params: GetFriendsParams(userId: user.id))),
                    color: ColorPallete.mainDecorationColor,
                    backgroundColor: ColorPallete.pinkDecorationColor,
                    strokeWidth: 4,
                    child: blocstate.friend.isEmpty
                        ? SingleChildScrollView(
                            controller: _friendsController,
                            child: const UserViewCard(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              margin: EdgeInsets.only(
                                  left: 100,
                                  right: 100,
                                  top: kGeneralPagesMargin),
                              children: [
                                Text(
                                  'Not found',
                                  style: AppTextStyle.headersSmall,
                                ),
                                Divider(),
                                Text(
                                  'pull down to refresh',
                                  style: AppTextStyle.descriptionSmall,
                                )
                              ],
                            ),
                          )
                        : SingleChildScrollView(
                            controller: _friendsController,
                            child: Column(
                              children: List.generate(
                                  blocstate.friend.length,
                                  (index) => SingleUserPreview(
                                        singleUser: blocstate.friend[index],
                                        rightActionIcons: [
                                          RightActionIcon(
                                            text: 'Send message',
                                            icon: AppIcons.messages
                                                .copyWith(size: 25),
                                            onTap: () {},
                                          ),
                                        ],
                                      )),
                            )),
                  );
                }
                if (blocstate is FriendsLoaded) {
                  print(blocstate);
                  return RefreshIndicator(
                    onRefresh: () async => context.read<FriendsActionBloc>()
                      ..add(FetchFriendsListEvent(
                          params: GetFriendsParams(userId: user.id))),
                    color: ColorPallete.mainDecorationColor,
                    backgroundColor: ColorPallete.pinkDecorationColor,
                    strokeWidth: 4,
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: blocstate.friends.isEmpty
                            ? 130
                            : Utils.sizeCalculator(
                                totalDimension: 130,
                                multipler: blocstate.friends.length.toDouble()),
                        child: blocstate.friends.isEmpty
                            ? ListView(
                                controller: _searchSqrController,
                                children: const [
                                  UserViewCard(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    margin: EdgeInsets.only(
                                        left: 100,
                                        right: 100,
                                        top: kGeneralPagesMargin),
                                    children: [
                                      Text(
                                        'Not found',
                                        style: AppTextStyle.headersSmall,
                                      ),
                                      Divider(),
                                      Text(
                                        'pull down to refresh',
                                        style: AppTextStyle.descriptionSmall,
                                      )
                                    ],
                                  )
                                ],
                              )
                            : ListView.builder(
                                itemCount: blocstate.friends.length,
                                itemBuilder: ((context, index) {
                                  return Column(
                                    children: [
                                      SingleUserPreview(
                                        singleUser: blocstate.friends[index],
                                        rightActionIcons: [
                                          RightActionIcon(
                                            text: 'Send message',
                                            icon: AppIcons.messages
                                                .copyWith(size: 25),
                                            onTap: () => {
                                              Navigator.pushNamed(
                                                  context, routeCreateMessage,
                                                  arguments:
                                                      blocstate.friends[index]),
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }),
                              )),
                  );
                } else {
                  return const Text('null');
                }
              })
            ],
          ),
        )),
      ),
    );
  }
}
