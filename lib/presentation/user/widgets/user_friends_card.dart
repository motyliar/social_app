import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/presentation/app/widgets/container_template.dart';
import 'package:climbapp/presentation/friends/business/bloc/friends_action_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constans/export_constans.dart';
import '../../../core/theme/themes_export.dart';

class UserFriendsCard extends StatelessWidget {
  const UserFriendsCard({
    super.key,
    required this.l10n,
  });

  final AppLocalizations l10n;

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
              height: 120,
              child: GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  children: List.generate(
                      3,
                      (index) => Container(
                          width: 70,
                          height: 120,
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(50)),
                          child: state.friends.length < index + 1
                              ? const Text('')
                              : GestureDetector(
                                  onTap: () => Navigator.popAndPushNamed(
                                      context, routeProfilePage,
                                      arguments: state.friends[index]),
                                  child: Column(children: [
                                    Stack(children: [
                                      CircleAvatar(
                                        radius: 35,
                                        backgroundImage: NetworkImage(
                                            state.friends[index].profileAvatar),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: CircleAvatar(
                                          radius: 8,
                                          backgroundColor: state
                                                  .friends[index].isActive
                                              ? ColorPallete.greenActiveColor
                                              : ColorPallete
                                                  .greyShadowColorOpacityMax,
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
