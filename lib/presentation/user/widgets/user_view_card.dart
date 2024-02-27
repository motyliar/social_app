import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/presentation/app/widgets/container_template.dart';
import 'package:flutter/material.dart';

class UserViewCard extends StatelessWidget {
  const UserViewCard({
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    super.key,
  });
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return ContainerTemplate(
      width: MediaQuery.of(context).size.width,
      color: ColorPallete.whiteOpacity80,
      borderRadius: kMinBorderRadius,
      margin: const EdgeInsets.only(
        left: kGeneralPagesMargin,
        right: kGeneralPagesMargin,
      ),
      padding: const EdgeInsets.all(kGeneralPagesMargin),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}
