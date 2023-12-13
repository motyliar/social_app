import 'package:flutter/material.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: 'template'),
      builder: (_) => const TemplatePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
