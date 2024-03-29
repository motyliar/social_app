import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/presentation/app/widgets/container_template.dart';
import 'package:climbapp/presentation/dashboard/widgets/auto_complete.dart';
import 'package:flutter/material.dart';

const double _height = 50;

class CSearchBar extends StatelessWidget {
  const CSearchBar({
    required this.width,
    this.height = _height,
    this.generalPadding = const EdgeInsets.only(bottom: 10.0),
    super.key,
  });
  final double width;
  final double height;
  final EdgeInsetsGeometry generalPadding;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: generalPadding,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ContainerTemplate(
          width: width,
          height: height,
          color: ColorPallete.mainDecorationColor.withOpacity(1),
          gradient: blueGreen,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoCompleteTextField(
                hintText: l10n.searchingNoticeHint,
                leftIcon: AppIcons.dashboardSearch,
                wordsLists: const <String>[],
              ),
              IconButton(onPressed: () {}, icon: AppIcons.searchPink),
            ],
          ),
        ),
      ),
    );
  }
}
