import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/domains/notice/entities/sub_entity/sub_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/dashboard/business/cubit/cubit/open_close_cubit.dart';
import 'package:climbapp/presentation/user/widgets/user_view_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AnimatedComment extends StatelessWidget {
  const AnimatedComment(
      {required this.open,
      required this.close,
      required this.comments,
      super.key});

  final Widget open;
  final Widget close;
  final List<CommentsEntity> comments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OpenCloseCubit()..changeVisible(change: false),
        child: BlocBuilder<OpenCloseCubit, bool>(
          builder: (context, state) {
            return state
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const HeadersSmallText(text: 'Comments'),
                            TextButton(
                                onPressed: () => context
                                    .read<OpenCloseCubit>()
                                    .changeVisible(),
                                child: const Icon(
                                  Icons.close,
                                  color: ColorPallete.mainDecorationColor,
                                ))
                          ],
                        ),
                        const Divider(),
                        Column(
                          children: comments.isNotEmpty
                              ? List.generate(
                                  comments.length,
                                  (index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              GestureDetector(
                                                onTap: () =>
                                                    Navigator.popAndPushNamed(
                                                        context,
                                                        routeProfilePage,
                                                        arguments: FriendsEntity(
                                                            id: comments[index]
                                                                .userId,
                                                            userName:
                                                                comments[index]
                                                                    .user,
                                                            profileAvatar:
                                                                comments[index]
                                                                    .avatar,
                                                            isActive: true,
                                                            lastLoggedIn: '')),
                                                child: CircleAvatar(
                                                  radius: 18,
                                                  backgroundImage: NetworkImage(
                                                      comments[index].avatar),
                                                ),
                                              ),
                                              const Gap(5),
                                              Text(
                                                comments[index].user,
                                                style: AppTextStyle
                                                    .descriptionBigL
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            comments[index].createdAt,
                                            style: AppTextStyle.descriptionMid,
                                          ),
                                        ],
                                      ),
                                      const Gap(3),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 8,
                                              top: 4,
                                              bottom: 4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      bottomRight:
                                                          Radius.circular(20)),
                                              color: ColorPallete
                                                  .mainDecorationColor
                                                  .withOpacity(0.3)),
                                          child: Text(
                                            comments[index]
                                                .content
                                                .capitalize(),
                                            style: AppTextStyle.descriptionBigL,
                                          ),
                                        ),
                                      ),
                                      const Gap(3),
                                    ],
                                  ),
                                )
                              : [],
                        ),
                        const Gap(5),
                      ])
                : Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: () =>
                            context.read<OpenCloseCubit>().changeVisible(),
                        child: close),
                  );
          },
        ));
  }
}
