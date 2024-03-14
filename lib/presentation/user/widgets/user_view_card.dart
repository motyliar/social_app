import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/presentation/app/widgets/container_template.dart';
import 'package:flutter/material.dart';

class GeneralCard extends StatelessWidget {
  const GeneralCard({
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.margin,
    this.padding,
    this.color,
    super.key,
  });
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ContainerTemplate(
      width: MediaQuery.of(context).size.width,
      color: color ?? ColorPallete.whiteOpacity80,
      borderRadius: kMinBorderRadius,
      margin: margin ??
          const EdgeInsets.only(
            left: kGeneralPagesMargin,
            right: kGeneralPagesMargin,
          ),
      padding: padding ?? const EdgeInsets.all(kGeneralPagesMargin),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: children,
      ),
    );
  }
}
