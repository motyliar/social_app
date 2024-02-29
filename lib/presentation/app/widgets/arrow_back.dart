import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 30,
          ),
          child: RoundButton(
              iconMargin: kMinEmptySpace,
              onTap: () => Navigator.of(context).pop(),
              icon: Icons.arrow_back,
              iconSize: 25,
              width: 40)),
    );
  }
}
