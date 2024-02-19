import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/icons/icons.dart';

import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/container_template.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/scroll_visible_control_cubit.dart';
import 'package:climbapp/presentation/dashboard/widgets/auto_complete.dart';
import 'package:climbapp/presentation/dashboard/widgets/search_bar.dart';
import 'package:climbapp/presentation/dashboard/widgets/widgets.dart';

import 'package:flutter/material.dart';

const double _height = 155;

class DashboardAppBar extends StatelessWidget implements PreferredSize {
  const DashboardAppBar({
    required this.mainChild,
    required this.controller,
    this.durationInMilisecond = 1200,
    super.key,
  });

  final Widget mainChild;
  final ScrollController controller;
  final int durationInMilisecond;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ScrollVisibleControlCubit(controller),
        child: BlocBuilder<ScrollVisibleControlCubit, bool>(
          builder: (context, isVisible) {
            return Visibility(
              visible: isVisible,
              child: AnimatedContainer(
                duration: Duration(milliseconds: durationInMilisecond),
                height: isVisible ? _height : 0,
                child: mainChild,
              ),
            );
          },
        ));
  }

  @override
  Widget get child => mainChild;
  @override
  Size get preferredSize => const Size.fromHeight(_height);
}

class DashBoardApp extends StatelessWidget {
  const DashBoardApp(
      {super.key,
      required this.controller,
      required this.imageSrc,
      required this.userName,
      this.isSearchBar = true,
      this.height = _height});
  final ScrollController controller;
  final bool isSearchBar;
  final String imageSrc;
  final String userName;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 155,
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
          height: 120,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProfileImage(imageSrc: imageSrc, userName: userName),
                    IconsRow(
                      controller: controller,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        isSearchBar
            ? CSearchBar(
                width: MediaQuery.of(context).size.width * 0.8,
              )
            : const SizedBox(),
      ]),
    );
  }
}
