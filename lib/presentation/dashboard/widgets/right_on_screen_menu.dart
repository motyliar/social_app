import 'package:climbapp/presentation/dashboard/widgets/slidable_menu.dart';
import 'package:flutter/material.dart';

class RightOnScreenMenu extends StatelessWidget {
  const RightOnScreenMenu({
    required this.menus,
    this.precentOfHeight = 0.3,
    super.key,
  });

  final List<SlidableMenu> menus;
  final double precentOfHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * precentOfHeight,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: menus,
      ),
    );
  }
}
