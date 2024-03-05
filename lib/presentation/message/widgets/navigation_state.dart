import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/mid_button.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constans/export_constans.dart';

class NavigationState extends StatelessWidget {
  const NavigationState({
    required this.direction,
    super.key,
  });

  final String direction;

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
                      ? AppTextStyle.headersSmall
                      : AppTextStyle.descriptionSmall,
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
                      ? AppTextStyle.headersSmall
                      : AppTextStyle.descriptionSmall,
                  textLabel: 'Send',
                  borderRadius: kSmallButtonBorderRadius,
                  onTap: () => context
                      .read<MessageViewCubit>()
                      .changeView(MessageView.send),
                ),
              ),
              const Gap(kGeneralPagesMargin),
              Opacity(
                opacity: direction.toLowerCase() == 'thrash' ? 1 : 0.6,
                child: MidTextButton(
                  margin: const EdgeInsets.all(0),
                  textStyle: AppTextStyle.descriptionSmall,
                  textLabel: 'Thrash',
                  borderRadius: kSmallButtonBorderRadius,
                  onTap: () => context
                      .read<MessageViewCubit>()
                      .changeView(MessageView.received),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
