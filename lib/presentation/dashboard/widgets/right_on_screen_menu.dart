import 'package:climbapp/presentation/dashboard/widgets/slidable_menu.dart';
import 'package:flutter/material.dart';

class RightOnScreenMenu extends StatelessWidget {
  const RightOnScreenMenu({
    required this.menus,
    super.key,
  });

  final List<SlidableMenu> menus;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.4,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: menus,
      ),
    );
  }
}
