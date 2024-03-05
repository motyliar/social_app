import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/utils/helpers/enums.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/mid_button.dart';
import 'package:climbapp/presentation/message/business/cubit/view/message_view_cubit.dart';
import 'package:flutter/material.dart';

import '../../../core/constans/export_constans.dart';

class NavigationState extends StatelessWidget {
  const NavigationState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessageViewCubit, MessageViewState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MidTextButton(
                margin: const EdgeInsets.all(0),
                textStyle: AppTextStyle.descriptionSmall,
                textLabel: 'Received',
                borderRadius: kSmallButtonBorderRadius,
                onTap: () => context
                    .read<MessageViewCubit>()
                    .changeView(MessageView.received),
              ),
              MidTextButton(
                margin: const EdgeInsets.all(0),
                textStyle: AppTextStyle.descriptionSmall,
                textLabel: 'Send',
                borderRadius: kSmallButtonBorderRadius,
                onTap: () => context
                    .read<MessageViewCubit>()
                    .changeView(MessageView.send),
              ),
              MidTextButton(
                margin: const EdgeInsets.all(0),
                textStyle: AppTextStyle.descriptionSmall,
                textLabel: 'Thrash',
                borderRadius: kSmallButtonBorderRadius,
                onTap: () => context
                    .read<MessageViewCubit>()
                    .changeView(MessageView.received),
              ),
            ],
          ),
        );
      },
    );
  }
}
