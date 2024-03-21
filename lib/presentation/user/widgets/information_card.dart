import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/presentation/app/widgets/container_template.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/constans/export_constans.dart';
import '../../../core/theme/themes_export.dart';

ContainerTemplate generateInformationCard(
    BuildContext context, AppLocalizations l10n, UserLoaded state) {
  return ContainerTemplate(
    margin: const EdgeInsets.only(
        left: kGeneralPagesMargin, right: kGeneralPagesMargin),
    padding: const EdgeInsets.all(kGeneralPagesMargin),
    borderRadius: kMinBorderRadius,
    width: MediaQuery.of(context).size.width,
    color: ColorPallete.whiteOpacity80,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.informationLabel,
          style: AppTextStyle.headersSmall,
        ),
        const Divider(),
        _InformationRowWidget(
          icon: Icons.person,
          title: l10n.name,
          details: state.user.userName,
        ),
        _InformationRowWidget(
            icon: Icons.email,
            title: l10n.emial,
            details: state.user.userEmail),
        _InformationRowWidget(
            icon: Icons.calendar_month,
            title: l10n.age,
            details: state.user.details?.age == null
                ? l10n.notSpecified
                : state.user.details!.age.toString()),
        _InformationRowWidget(
            icon: Icons.location_city, title: l10n.from, details: 'Poznan'),
        _InformationRowWidget(
            icon: Icons.military_tech,
            iconColor: ColorPallete.gold,
            title: l10n.rank,
            details: '4.8')
      ],
    ),
  );
}

class _InformationRowWidget extends StatelessWidget {
  const _InformationRowWidget({
    required this.icon,
    required this.title,
    required this.details,
    this.iconColor = ColorPallete.mainDecorationColor,
  });
  final IconData icon;
  final String title;
  final String details;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          Text(title),
          Text(
            details,
            style: AppTextStyle.descriptionMid,
          ),
        ],
      ),
    );
  }
}
