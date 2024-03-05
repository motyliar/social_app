import 'package:climbapp/core/datahelpers/params/message/message_params.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:climbapp/presentation/message/business/cubit/delete/message_delete_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../core/constans/export_constans.dart';

Slidable CreatingSlidableActions({
  required AppLocalizations l10n,
  required UserEntity user,
  required int index,
  required String today,
  required Widget child,
  required String direction,
  required MessageEntity message,
}) {
  return Slidable(
      startActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          borderRadius: BorderRadius.circular(kSmallButtonBorderRadius),
          onPressed: (context) {},
          icon: Icons.message,
          backgroundColor: ColorPallete.mainDecorationColor,
          label: l10n.sendPageTop,
        )
      ]),
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        BlocBuilder<MessageDeleteCubit, MessageDeleteState>(
          builder: (context, state) {
            return SlidableAction(
              borderRadius: BorderRadius.circular(kSmallButtonBorderRadius),
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: l10n.deleteButton,
              onPressed: (context) =>
                  context.read<MessageDeleteCubit>().deleteMessagesFromDB(
                        deleteParams: MessageDeleteParams(
                            url: AppUrl.deleteMessage(user.id),
                            direction: direction,
                            delete: [message.id]),
                      ),
            );
          },
        )
      ]),
      child: child);
}
