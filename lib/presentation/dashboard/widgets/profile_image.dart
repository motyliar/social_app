import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/helpers/extension.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/tap_down_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.imageSrc,
    required this.userName,
    this.isAnimate,
    this.onTap,
  });

  final String imageSrc;
  final String userName;
  final bool? isAnimate;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TapDownCubit(),
      child: BlocBuilder<TapDownCubit, bool>(
        builder: (context, isTap) {
          return GestureDetector(
            onTap: () => onTap == null
                ? Navigator.pushNamed(context, routeUserMain)
                : onTap!(),
            onTapDown: (details) =>
                isAnimate ?? BlocProvider.of<TapDownCubit>(context).onTapDown(),
            onTapCancel: () =>
                isAnimate ?? BlocProvider.of<TapDownCubit>(context).onTapDown(),
            onTapUp: (details) =>
                isAnimate ?? BlocProvider.of<TapDownCubit>(context).onTapDown(),
            child: Row(
              children: [
                Transform.rotate(
                  angle: isTap ? 1 : 0,
                  child: CircleAvatar(
                    radius: isTap ? 41 : 37,
                    backgroundImage: NetworkImage(imageSrc),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1100),
                  child: Text(
                    userName.capitalize(),
                    style: AppTextStyle.headersAppBar.copyWith(
                        color: isTap
                            ? ColorPallete.mainDecorationColor
                            : Colors.black,
                        fontSize: isTap ? 22 : 18),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
