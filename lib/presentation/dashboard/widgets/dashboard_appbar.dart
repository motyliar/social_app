import 'package:climbapp/core/constans/export_constans.dart';

import 'package:climbapp/presentation/app.dart';

import 'package:climbapp/presentation/dashboard/business/cubit/cubit/scroll_visible_control_cubit.dart';

import 'package:climbapp/presentation/dashboard/widgets/search_bar.dart';
import 'package:climbapp/presentation/dashboard/widgets/widgets.dart';

import 'package:flutter/material.dart';

const double _height = 155;
const double _imageHeight = 120;

class DashboardAppBar extends StatelessWidget implements PreferredSize {
  const DashboardAppBar({
    required this.mainChild,
    required this.controller,
    this.durationInMilisecond = 1200,
    this.height = _height,
    super.key,
  });

  final Widget mainChild;
  final ScrollController controller;
  final int durationInMilisecond;
  final double height;

  @override
  Widget build(BuildContext context) {
    return mainChild;
  }

  @override
  Widget get child => mainChild;
  @override
  Size get preferredSize => Size.fromHeight(height);
}

class DashBoardApp extends StatelessWidget {
  const DashBoardApp(
      {super.key,
      required this.controller,
      required this.imageSrc,
      required this.userName,
      this.isSearchBar = true,
      this.height = _height,
      this.marginLeft = 20,
      this.marginRight = 20,
      this.isProfile = false,
      this.isAnimateImage,
      this.profileImageFunction});
  final ScrollController controller;
  final bool isSearchBar;
  final String imageSrc;
  final String userName;
  final double height;
  final double marginLeft;
  final double marginRight;
  final bool isProfile;
  final bool? isAnimateImage;
  final VoidCallback? profileImageFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: height,
      child: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(maxBorderRadius),
                  bottomRight: Radius.circular(maxBorderRadius)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  ImagesURL.signInBottomBackground,
                ),
              )),
          width: MediaQuery.of(context).size.width,
          height: _imageHeight,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: marginLeft, right: marginRight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileImage(
                      onTap: profileImageFunction != null
                          ? () => profileImageFunction!()
                          : null,
                      imageSrc: imageSrc,
                      userName: userName,
                      isAnimate: isAnimateImage,
                    ),
                    IconsRow(
                      isProfile: isProfile,
                      controller: controller,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        isSearchBar
            ? Positioned(
                left: centerSearchBar(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.width * 0.8),
                bottom: 20,
                child: CSearchBar(
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              )
            : const SizedBox(),
      ]),
    );
  }
}

double centerSearchBar(double totalWidth, double searchBarWidth,
    {double multipler = 0.5}) {
  return (totalWidth - searchBarWidth) * multipler;
}
