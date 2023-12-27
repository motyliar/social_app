import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: 'template'),
      builder: (_) => const MessagePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
