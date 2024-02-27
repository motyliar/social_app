import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/shadows.dart';
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
        UserViewCard(children: [
          const Text(
            'Your favourite sports',
            style: AppTextStyle.headersSmall,
          ),
          const Divider(),
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
                builder: (context, state) {
                  return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: (30 * state.sports.length).toDouble(),
                      child: ListView.builder(
                          itemCount: state.sports.length,
                          itemBuilder: (context, index) => Container(
                                width: 100,
                                height: 30,
                                child: Text(state.sports[index].name),
                              )));
                },
              );
            },
          ),
        ]),
        GradientDivider(
          dividerHeight: 15.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 90, right: 90),
          child: UserViewCard(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<SportsCubit, SportsState>(
                  builder: (context, state) {
                    return DragTarget<Sport>(
                      onAccept: (sport) {
                        BlocProvider.of<SportsCubit>(context)
                            .addSportToFavorite(sport);

                        print(favoriteSports);
                      },
                      builder: ((context, candidateData, rejectedData) =>
                          Container(
                            width: 80,
                            height: 80,
                            child: Center(
                                child: Icon(
                              Icons.add,
                              size: 60,
                            )),
                          )),
                    );
                  },
                ),
              ]),
        ),
        GradientDivider(dividerHeight: 15.0),
        UserViewCard(children: [
          Text(
            'Choose 4 sports',
            style: AppTextStyle.headersSmall,
          ),
          Divider(),
          Align(
            alignment: Alignment.center,
            child: BlocBuilder<SportsCubit, SportsState>(
              builder: (context, state) {
                return SizedBox(
                  height: 130,
                  width: 250,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemCount: state.possibleSport.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(1),
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
                                      boxShadow: [greyLeftShadow],
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
                                decoration: BoxDecoration(
                                    gradient: blueGreenGradient,
                                    boxShadow: [greyLeftShadow],
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
