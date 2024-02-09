// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:climbapp/core/constans/constans.dart';
import 'package:climbapp/presentation/dashboard/widgets/widgets.dart';
import 'package:flutter/material.dart';

const double _height = 100;
const double _topMargin = 20;

class SlidableNavigator extends StatelessWidget {
  const SlidableNavigator({
    this.desriptions = kHorizontalMenuDescriptions,
    this.topMargin = _topMargin,
    this.height = _height,
    super.key,
  });

  final List<String> desriptions;
  final double topMargin;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin),
      height: height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: desriptions.length,
        itemBuilder: (context, index) {
          return HorizontalNavigatorButton(
            descriptionText: desriptions[index],
          );
        },
      ),
    );
  }
}
