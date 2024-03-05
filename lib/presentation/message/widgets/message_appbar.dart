import 'package:flutter/material.dart';

class MessageAppBar extends StatelessWidget implements PreferredSize {
  const MessageAppBar({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text('App Bar'),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size.fromHeight(height);
}
