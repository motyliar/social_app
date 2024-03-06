import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:climbapp/presentation/message/business/cubit/delete/message_delete_cubit.dart';
import 'package:climbapp/presentation/message/widgets/animated_action.dart';
import 'package:climbapp/presentation/message/widgets/delete_actions_buttons.dart';
import 'package:climbapp/presentation/message/widgets/navigation_state.dart';
import 'package:climbapp/presentation/profile/widgets/little_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.direction,
    required this.user,
    required this.messages,
    this.height,
    this.background,
    this.children,
  });

  final String direction;
  final UserEntity user;
  final List<MessageEntity> messages;
  final double? height;
  final Widget? background;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: ColorPallete.scaffoldBackground,
      automaticallyImplyLeading: false,
      expandedHeight: height ??
          Utils.sizeCalculator(
              totalDimension: MediaQuery.of(context).size.height,
              multipler: 0.20),
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: background ??
            Stack(
              children: [
                const LittleAppBar(),
                Positioned(
                  bottom: 0,
                  left: kGeneralPagesMargin,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: children ??
                          [
                            BlocBuilder<MessageDeleteCubit, MessageDeleteState>(
                              builder: (context, delete) {
                                return AnimatedAction(
                                    childOne: NavigationState(
                                      thirdText: 'Thrash',
                                      direction: direction,
                                    ),
                                    childTwo: DeleteActionButtons(
                                        user: user,
                                        direction: direction,
                                        messages: messages),
                                    condition: delete.messageIds.isEmpty);
                              },
                            ),
                          ]),
                ),
              ],
            ),
      ),
    );
  }
}
