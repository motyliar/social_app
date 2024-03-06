import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/mid_button.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constans/export_constans.dart';

class NavigationState extends StatelessWidget {
  const NavigationState({
    required this.direction,
    this.thirdButtonFunction,
    required this.thirdText,
    this.isThird = false,
    this.activeButtonStyle = AppTextStyle.headersSmall,
    this.inActiveButtonStyle = AppTextStyle.descriptionSmall,
    super.key,
  });

  final String direction;
  final VoidCallback? thirdButtonFunction;
  final bool isThird;
  final String thirdText;
  final TextStyle activeButtonStyle;
  final TextStyle inActiveButtonStyle;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageViewCubit, MessageViewState>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: direction.toLowerCase() == 'received' ? 1 : 0.6,
                child: MidTextButton(
                  margin: const EdgeInsets.all(0),
                  textStyle: direction.toLowerCase() == 'received'
                      ? activeButtonStyle
                      : inActiveButtonStyle,
                  textLabel: 'Received',
                  borderRadius: kSmallButtonBorderRadius,
                  onTap: () => context
                      .read<MessageViewCubit>()
                      .changeView(MessageView.received),
                ),
              ),
              const Gap(kGeneralPagesMargin),
              Opacity(
                opacity: direction.toLowerCase() == 'send' ? 1 : 0.6,
                child: MidTextButton(
                  margin: const EdgeInsets.all(0),
                  textStyle: direction.toLowerCase() == 'send'
                      ? activeButtonStyle
                      : inActiveButtonStyle,
                  textLabel: 'Send',
                  borderRadius: kSmallButtonBorderRadius,
                  onTap: () => context
                      .read<MessageViewCubit>()
                      .changeView(MessageView.send),
                ),
              ),
              const Gap(kGeneralPagesMargin),
              Opacity(
                opacity: isThird ? 1 : 0.6,
                child: MidTextButton(
                  margin: const EdgeInsets.all(0),
                  textStyle: isThird ? activeButtonStyle : inActiveButtonStyle,
                  textLabel: thirdText.capitalize(),
                  borderRadius: kSmallButtonBorderRadius,
                  onTap: () => thirdButtonFunction != null
                      ? thirdButtonFunction!()
                      : null,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
