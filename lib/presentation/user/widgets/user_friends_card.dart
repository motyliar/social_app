// ignore_for_file: unused_element

import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/presentation/app/widgets/container_template.dart';
import 'package:climbapp/presentation/friends/business/bloc/friends_action_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constans/export_constans.dart';
import '../../../core/theme/themes_export.dart';

const double _friendsBoxHeight = 120;
const double _singleFriendWidth = 70;
const String _showNothing = '';
const double _avatarRadius = 35;

class UserFriendsCard extends StatelessWidget {
  const UserFriendsCard({
    super.key,
    required this.l10n,
    this.friendOnTap,
    this.avatarRadius = _avatarRadius,
  });

  final AppLocalizations l10n;
  final VoidCallback? friendOnTap;
  final double avatarRadius;

  @override
  Widget build(BuildContext context) {
    return ContainerTemplate(
      margin: const EdgeInsets.only(
          left: kGeneralPagesMargin, right: kGeneralPagesMargin),
      width: MediaQuery.of(context).size.width - (2 * kGeneralPagesMargin),
      borderRadius: kMinBorderRadius,
      padding: const EdgeInsets.all(kGeneralPagesMargin),
      color: ColorPallete.whiteOpacity80,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          l10n.friends,
          style: AppTextStyle.headersSmall,
        ),
        Row(
          children: [
            Text(
              '${l10n.friendsInfo} ${context.select((FriendsActionBloc bloc) => bloc.state.friends.length)} ${l10n.friends.toLowerCase()}',
              style: AppTextStyle.descriptionSmall,
            ),
          ],
        ),
        const Divider(),
        BlocBuilder<FriendsActionBloc, FriendsActionState>(
          builder: (context, state) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: _friendsBoxHeight,
              child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  children: List.generate(
                      3,
                      (index) => Container(
                          width: _singleFriendWidth,
                          height: _friendsBoxHeight,
                          margin: const EdgeInsets.all(kMinEmptySpace),
                          padding: const EdgeInsets.all(kMinEmptySpace),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius:
                                  BorderRadius.circular(maxBorderRadius)),
                          child: state.friends.length < index + 1
                              ? const Text(_showNothing)
                              : GestureDetector(
                                  onTap: () =>
                                      friendOnTap ??
                                      Navigator.popAndPushNamed(
                                          context, routeProfilePage,
                                          arguments: state.friends[index]),
                                  child: Column(children: [
                                    Stack(children: [
                                      CircleAvatar(
                                        radius: avatarRadius,
                                        backgroundImage: NetworkImage(
                                            state.friends[index].profileAvatar),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: _ActiveDot(
                                          isActive:
                                              state.friends[index].isActive,
                                        ),
                                      ),
                                    ]),
                                    Text(state.friends[index].userName)
                                  ]),
                                )))),
            );
          },
        ),
        const Divider(),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            l10n.checkMore,
            style: AppTextStyle.descriptionMid,
          ),
        ),
      ]),
    );
  }
}

class _ActiveDot extends StatelessWidget {
  final bool isActive;
  final Color activeColor;
  final Color inActiveColor;
  final double radius;
  const _ActiveDot(
      {required this.isActive,
      this.activeColor = ColorPallete.greenActiveColor,
      this.inActiveColor = ColorPallete.greyShadowColorOpacityMax,
      this.radius = 8,
      super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: radius,
        backgroundColor: isActive ? activeColor : inActiveColor);
  }
}
