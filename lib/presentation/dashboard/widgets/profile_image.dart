import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.imageSrc,
    required this.userName,
  });

  final String imageSrc;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(imageSrc),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(userName.capitalize(), style: AppTextStyle.headersAppBar),
      ],
    );
  }
}
