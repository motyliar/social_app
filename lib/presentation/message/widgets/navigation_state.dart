import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/mid_button.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constans/export_constans.dart';

const String _receivedDirection = 'received';
const String _sendDirection = 'send';
const double _activeButtonOpacity = 1;
const double _inActivButtonOpacity = 0.6;

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
    final l10n = context.l10n;
    return BlocBuilder<MessageViewCubit, MessageViewState>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: direction.toLowerCase() == _receivedDirection
                    ? _activeButtonOpacity
                    : _inActivButtonOpacity,
                child: MidTextButton(
                  margin: const EdgeInsets.all(0),
                  textStyle: direction.toLowerCase() == _receivedDirection
                      ? activeButtonStyle
                      : inActiveButtonStyle,
                  textLabel: l10n.receivedPageTop,
                  borderRadius: kSmallButtonBorderRadius,
                  onTap: () => context
                      .read<MessageViewCubit>()
                      .changeView(MessageView.received),
                ),
              ),
              const Gap(kGeneralPagesMargin),
              Opacity(
                opacity: direction.toLowerCase() == _sendDirection
                    ? _activeButtonOpacity
                    : _inActivButtonOpacity,
                child: MidTextButton(
                  margin: const EdgeInsets.all(0),
                  textStyle: direction.toLowerCase() == _sendDirection
                      ? activeButtonStyle
                      : inActiveButtonStyle,
                  textLabel: l10n.sendPageTop,
                  borderRadius: kSmallButtonBorderRadius,
                  onTap: () => context
                      .read<MessageViewCubit>()
                      .changeView(MessageView.send),
                ),
              ),
              const Gap(kGeneralPagesMargin),
              Opacity(
                opacity: isThird ? _activeButtonOpacity : _inActivButtonOpacity,
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
