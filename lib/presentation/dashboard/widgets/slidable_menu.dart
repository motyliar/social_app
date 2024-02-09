import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/slidable_menu_cubit.dart';
import 'package:flutter/material.dart';

const int _animationDuration = 150;
const double _closeStateSize = 35;
const double _openStateSizeWidth = 200;
const double _openStateSizeHeight = 300;

class SlidableMenu extends StatelessWidget {
  const SlidableMenu({
    this.padding = fivePixelsSpaceBetweenWidgets,
    this.durationInMillisecond = _animationDuration,
    this.closeStateSize = _closeStateSize,
    this.openStateSizeWidth = _openStateSizeWidth,
    this.openStateSizeHeight = _openStateSizeHeight,
    required this.windowName,
    super.key,
  });
  final String windowName;
  final double padding;
  final int durationInMillisecond;
  final double closeStateSize;
  final double openStateSizeWidth;
  final double openStateSizeHeight;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SlidableMenuCubit, Map<String, bool>>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: padding),
          child: GestureDetector(
              onTap: () => BlocProvider.of<SlidableMenuCubit>(context)
                  .changeVisible(windowName),
              child: AnimatedContainer(
                duration: Duration(milliseconds: durationInMillisecond),
                width: state[windowName]! ? closeStateSize : openStateSizeWidth,
                height:
                    state[windowName]! ? closeStateSize : openStateSizeHeight,
                decoration: BoxDecoration(
                    color: ColorPallete.mainDecorationColor,
                    borderRadius: BorderRadius.circular(maxBorderRadius),
                    boxShadow: const [greyLeftShadow]),
                curve: Curves.easeIn,
                child: state[windowName]!
                    ? const Icon(
                        Icons.settings,
                        color: Colors.white,
                      )
                    // todo add children to view - sport to choose
                    : const Wrap(children: [
                        Column(
                          children: [],
                        ),
                      ]),
              )),
        );
      },
    );
  }
}
