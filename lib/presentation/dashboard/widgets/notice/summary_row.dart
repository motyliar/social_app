import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/like_icon_cubit.dart';
import 'package:climbapp/presentation/dashboard/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SummaryRow extends StatelessWidget {
  const SummaryRow({
    this.onPressed,
    super.key,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final visible = context.select((LikeIconCubit bloc) => bloc.state);
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            SizedBox(
              width: kMidEmptySpace,
            ),
            SizedBox(
              width: kMidEmptySpace,
            ),
            Text('20'),
          ],
        ),
        TextButton(
          onPressed: () => onPressed == null ? null : onPressed!(),
          child: Text(
            '${l10n.noticeComments} ${notice.comments?.length ?? 0}',
            style: AppTextStyle.descriptionMid,
          ),
        ),
      ],
    );
  }
}
