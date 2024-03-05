import 'package:climbapp/core/constans/network_images.dart';
import 'package:climbapp/domains/messages/entities/message_entity.dart';
import 'package:flutter/material.dart';

const double _avatarRadius = 20;

class AnimatedAvatar extends StatelessWidget {
  const AnimatedAvatar({
    super.key,
    required this.isRead,
    required this.avatarImage,
    this.durationInMiliseconds = 300,
    this.avatarRadius,
  });
  final bool isRead;

  final String avatarImage;
  final int durationInMiliseconds;
  final double? avatarRadius;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: durationInMiliseconds),
      child: CircleAvatar(
        radius: avatarRadius ?? _avatarRadius,
        backgroundImage: isRead
            ? const NetworkImage(ImagesURL.approve)
            : NetworkImage(avatarImage),
      ),
    );
  }
}
