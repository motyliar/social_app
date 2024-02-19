import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/presentation/app/widgets/container_template.dart';
import 'package:climbapp/presentation/dashboard/widgets/auto_complete.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
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
    );
  }
}
