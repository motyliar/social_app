import 'package:flutter/material.dart';

class StackCenter extends StatelessWidget {
  const StackCenter(
      {required this.appWidth,
      required this.widgetWidth,
      required this.child,
      super.key});
  final double appWidth;
  final double widgetWidth;
  final Widget child;

  double _centerWidgetCalculate() {
    double byHalf = 0.5;
    final centerMargin = (appWidth - widgetWidth) * byHalf;
    return centerMargin;
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(
            left: _centerWidgetCalculate(), right: _centerWidgetCalculate()),
        child: child,
      ),
    ]);
  }
}
