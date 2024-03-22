import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/network_images.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/theme/gradients.dart';
import 'package:climbapp/presentation/app/widgets/round_button.dart';
import 'package:climbapp/presentation/user/widgets/user_view_card.dart';
import 'package:flutter/material.dart';

const double _logoSize = 120;
const double _logoRightPadding = 40;

class BackCard extends StatelessWidget {
  const BackCard({
    super.key,
    this.logoSize = _logoSize,
    this.logoTransition = 13,
    this.logoPaddingFromRight = _logoRightPadding,
    this.onBack,
  });

  final double logoSize;
  final double logoTransition;
  final double logoPaddingFromRight;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return GeneralCard(
        gradient: blueGreen,
        padding: EdgeInsets.only(
            left: kGeneralPagesMargin, right: logoPaddingFromRight),
        margin: const EdgeInsets.only(
            left: kMidEmptySpace,
            right: kMidEmptySpace,
            top: kMidEmptySpace,
            bottom: kMidEmptySpace),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundBackButton(
                onTap: () => onBack == null
                    ? Navigator.popAndPushNamed(
                        context,
                        routeDashboardPage,
                      )
                    : onBack!(),
              ),
              Transform.rotate(
                angle: 13,
                child: Image.network(
                  ImagesURL.appLogo,
                  width: _logoSize,
                  height: _logoSize,
                ),
              ),
            ],
          )
        ]);
  }
}
