import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/colors.dart';

import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/empty_space.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/user/business/cubit/cubit/cubit/sports_cubit.dart';
import 'package:climbapp/presentation/user/business/cubit/cubit/view_switch_cubit.dart';
import 'package:climbapp/presentation/user/business/enum.dart';
import 'package:climbapp/presentation/user/view/subview/sports.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';

Key listKey = UniqueKey();

class UserSport extends StatelessWidget {
  const UserSport({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> favoriteSports = [];
    Sport? _draggingSport;
    return BlocProvider(
      create: (context) => SportsCubit(),
      child: Column(children: [
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
        BlocConsumer<SportsCubit, SportsState>(
          listener: (context, state) {
            if (state.status == SportStatus.fail) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Too much'),
                duration: Duration(milliseconds: 500),
              ));

              context.read<SportsCubit>().restartStatusToNeutral();
            }
          },
          builder: (context, state) {
            return BlocBuilder<SportsCubit, SportsState>(
                buildWhen: ((previous, current) =>
                    previous.status != current.status),
                builder: (context, state) {
                  return DragTarget<Sport>(
                      onAccept: (sport) {
                        BlocProvider.of<SportsCubit>(context)
                            .addSportToFavorite(sport);
                        BlocProvider.of<SportsCubit>(context)
                            .restartStatusToNeutral();
                      },
                      builder: ((context, candidateData, rejectedData) =>
                          UserViewCard(children: [
                            Text(
                              state.sports.sports.isEmpty
                                  ? 'Drag your favourite sports'
                                  : 'Favourite sports',
                              style: AppTextStyle.headersSmall,
                            ),
                            Divider(),
                            SizedBox(
                              width: Utils.sizeCalculator(
                                  totalDimension:
                                      MediaQuery.of(context).size.width,
                                  multipler: 0.8),
                              height: Utils.sizeCalculator(
                                  totalDimension: 40,
                                  multipler:
                                      state.sports.sports.length.toDouble()),
                              child: Column(
                                children: List.generate(
                                    state.sports.sports.length,
                                    (index) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 3),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            MidTextButton(
                                                margin: const EdgeInsets.only(
                                                    left:
                                                        fivePixelsSpaceBetweenWidgets,
                                                    bottom:
                                                        fivePixelsSpaceBetweenWidgets),
                                                textStyle:
                                                    AppTextStyle.headersSmall,
                                                buttonWidth: 110,
                                                buttonHeight: 30,
                                                textLabel: state
                                                    .sports.sports[index].name),
                                            Row(children: [
                                              Row(
                                                children: List.generate(
                                                    5,
                                                    (number) => GestureDetector(
                                                        onTap: () {
                                                          context
                                                              .read<
                                                                  SportsCubit>()
                                                              .incrementRateOfEachSport(
                                                                  index,
                                                                  number);
                                                          context
                                                              .read<
                                                                  SportsCubit>()
                                                              .restartStatusToNeutral();
                                                        },
                                                        child: Icon(
                                                          Icons.fitness_center,
                                                          color: state
                                                                      .sports
                                                                      .sports[
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
                                                        .read<SportsCubit>()
                                                        .removeSportFromFavorite(
                                                            state.sports
                                                                .sports[index]);
                                                    context
                                                        .read<SportsCubit>()
                                                        .restartStatusToNeutral();
                                                  },
                                                  child: AppIcons.delete
                                                      .copyWith(size: 25)),
                                            ]),
                                          ],
                                        ))),
                              ),
                            )
                          ])));
                });
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: MidTextButton(
            onTap: () {},
            buttonWidth: 70,
            textLabel: 'Save',
            textStyle: AppTextStyle.headersSmall,
            margin: const EdgeInsets.only(
                top: fivePixelsSpaceBetweenWidgets,
                bottom: fivePixelsSpaceBetweenWidgets,
                right: kGeneralPagesMargin),
          ),
        ),
        const GradientDivider(
          dividerHeight: kMidDividerHeight,
        ),
        UserViewCard(children: [
          const Text(
            'Choose 4 sports',
            style: AppTextStyle.headersSmall,
          ),
          const Divider(),
          Align(
            alignment: Alignment.center,
            child: BlocBuilder<SportsCubit, SportsState>(
              builder: (context, state) {
                return SizedBox(
                  height: 150,
                  width: 300,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemCount: state.possibleSport.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(2),
                            child: Draggable<Sport>(
                              data: state.possibleSport[index],
                              onDragStarted: () =>
                                  _draggingSport = state.possibleSport[index],
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
                                          state.possibleSport[index].name)),
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
                                    child:
                                        Text(state.possibleSport[index].name)),
                              ),
                            ));
                      }),
                );
              },
            ),
          ),
        ])
      ]),
    );
  }
}
