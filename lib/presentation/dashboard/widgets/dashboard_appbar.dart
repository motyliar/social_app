import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/core/theme/shadows.dart';
import 'package:climbapp/presentation/app/widgets/container_template.dart';
import 'package:climbapp/presentation/dashboard/widgets/auto_complete.dart';
import 'package:climbapp/presentation/dashboard/widgets/widgets.dart';
import 'package:climbapp/presentation/sign_in/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class DashboardAppBar extends StatelessWidget {
  final String imageSrc;
  final String userName;

  const DashboardAppBar({
    required this.imageSrc,
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    const IconsRow(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ContainerTemplate(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            color: ColorPallete.mainDecorationColor.withOpacity(1),
            gradient: blueGreen,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AutoCompleteTextField(
                  hintText: 'Search for sport notice',
                  leftIcon: AppIcons.dashboardSearch,
                  wordsLists: <String>[],
                ),
                IconButton(onPressed: () {}, icon: AppIcons.searchPink),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
