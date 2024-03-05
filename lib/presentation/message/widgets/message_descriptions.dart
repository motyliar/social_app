import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MessageDescriptions extends StatelessWidget {
  const MessageDescriptions({
    super.key,
    required this.message,
    required this.today,
  });

  final MessageEntity message;
  final String today;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 230,
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      message.sender,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Row(
                  children: [Text(Utils.currentData(today, message.createdAt))],
                )
              ]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      message.subject,
                      style: AppTextStyle.descriptionMid,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(kMinEmptySpace),
          ],
        ),
      ],
    );
  }
}
