import 'package:flutter/material.dart';

class NoticeLoader extends StatelessWidget {
  const NoticeLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
          children: List.generate(
        6,
        (index) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 200,
            decoration: const BoxDecoration(color: Colors.grey),
            child: const Center(
              child: CircularProgressIndicator(),
            )),
      )),
    );
  }
}
