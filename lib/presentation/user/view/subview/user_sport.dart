import 'package:flutter/material.dart';
import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/datahelpers/params/sports/get_sports_params.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/sports/entities/structure/sport_type.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/app/widgets/loading_state.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/business/cubit/load_sport/load_sport_cubit.dart';
import 'package:climbapp/presentation/user/business/cubit/view_switch/view_switch_cubit.dart';
import 'package:climbapp/presentation/user/business/enum.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';

Key listKey = UniqueKey();

class UserSport extends StatelessWidget {
  const UserSport({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user.id);
    // ignore: unused_local_variable
    SportType? draggingSport;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: kGeneralPagesMargin, left: kGeneralPagesMargin),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: RoundBackButton(
              onTap: () => BlocProvider.of<ViewSwitchCubit>(context)
                  .changeStatus(ViewStatus.main),
            ),
          ),
        ),
        const EmptySpace(),
        BlocBuilder<LoadSportCubit, LoadSportState>(
          builder: (context, state) {
            if (state is LoadSportLoading) {
              return const LoadingPage();
            }
            if (state is LoadSportFailed) {
              //todo implementing
            }

            return DragTarget<SportType>(
              onAccept: (data) {
                context.read<LoadSportCubit>().changeSportValue(data.name);
              },
              builder: ((context, candidateData, rejectedData) => GeneralCard(
                    children: [
                      Text(state.sports.greaterThen().isEmpty
                          ? 'Drag your favourite sport'
                          : 'Favourite Sports'),
                      const Divider(),
                      state.sports.greaterThen().isEmpty
                          ? Container()
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Set your skill',
                                  style: AppTextStyle.descriptionMid,
                                ),
                                SizedBox(
                                  width: kMinEmptySpace,
                                ),
                                Tooltip(
                                    message: 'From begginer to advanced',
                                    child: Icon(Icons.info)),
                              ],
                            ),
                      SizedBox(
                        width: Utils.sizeCalculator(
                            totalDimension: MediaQuery.of(context).size.width,
                            multipler: 0.8),
                        height: Utils.sizeCalculator(
                          totalDimension: 40,
                          multipler:
                              state.sports.greaterThen().length.toDouble(),
                        ),
                        child: Column(
                          children: List.generate(
                            state.sports.greaterThen().length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 3),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MidTextButton(
                                      margin: const EdgeInsets.only(
                                          left: kMinEmptySpace,
                                          bottom: kMinEmptySpace),
                                      textStyle: AppTextStyle.headersSmall,
                                      buttonWidth: 110,
                                      buttonHeight: 30,
                                      textLabel: state.sports
                                          .greaterThen()[index]
                                          .name),
                                  Row(
                                    children: [
                                      Row(
                                        children: List.generate(
                                            5,
                                            (number) => GestureDetector(
                                                onTap: () {
                                                  context
                                                      .read<LoadSportCubit>()
                                                      .changeSportValue(
                                                          state.sports
                                                              .greaterThen()[
                                                                  index]
                                                              .name,
                                                          value: number + 1);
                                                },
                                                child: Icon(
                                                  Icons.fitness_center,
                                                  color: state.sports
                                                              .greaterThen()[
                                                                  index]
                                                              .value <=
                                                          number
                                                      ? ColorPallete
                                                          .greyShadowColorOpacityMax
                                                      : ColorPallete
                                                          .mainDecorationColor,
                                                ))),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            context
                                                .read<LoadSportCubit>()
                                                .changeSportValue(
                                                    state.sports
                                                        .greaterThen()[index]
                                                        .name,
                                                    value: 0);
                                          },
                                          child: AppIcons.delete
                                              .copyWith(size: 25)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: MidTextButton(
                          onTap: () {
                            context.read<LoadSportCubit>().updateSportData(
                                UpdateSportParams(
                                    body: state.sports.toJson(),
                                    url: AppUrl.updateSportsURL(user)));
                          },
                          buttonWidth: 70,
                          textLabel: 'Save',
                          textStyle: AppTextStyle.headersSmall,
                          margin: const EdgeInsets.only(
                              top: kMinEmptySpace,
                              bottom: kMinEmptySpace,
                              right: kGeneralPagesMargin),
                        ),
                      ),
                    ],
                  )),
            );
          },
        ),
        const GradientDivider(
          dividerHeight: kMidDividerHeight,
        ),
        GeneralCard(
          children: [
            const Text(
              'Choose 4 sports',
              style: AppTextStyle.headersSmall,
            ),
            const Divider(),
            Align(
                alignment: Alignment.center,
                child: BlocBuilder<LoadSportCubit, LoadSportState>(
                    builder: (context, state) {
                  return SizedBox(
                    height: (state.sports.equals().length ~/ 4) * 120,
                    width: 300,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemCount: state.sports.equals().length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(2),
                            child: Draggable<SportType>(
                              data: state.sports.equals()[index],
                              onDragStarted: () =>
                                  draggingSport = state.sports.equals()[index],
                              childWhenDragging: Container(),
                              feedback: Material(
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: pinkToBlueRoundGradient,
                                      boxShadow: const [greyLeftShadow],
                                      borderRadius: BorderRadius.circular(
                                          kMinBorderRadius)),
                                  width: 62.5,
                                  height: 62.5,
                                  child: Center(
                                      child: Text(
                                    state.sports
                                        .equals()[index]
                                        .name
                                        .capitalize(),
                                    style: AppTextStyle.descriptionSmall,
                                  )),
                                ),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                    gradient: blueGreenGradient,
                                    boxShadow: const [greyLeftShadow],
                                    borderRadius: BorderRadius.circular(
                                        kMinBorderRadius)),
                                width: 62.5,
                                height: 62.5,
                                child: Center(
                                    child: Text(state.sports
                                        .equals()[index]
                                        .name
                                        .capitalize())),
                              ),
                            ));
                      },
                    ),
                  );
                }))
          ],
        )
      ],
    );
  }
}
