import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/utils/helpers/lorem_ipsum.dart';
import 'package:climbapp/domains/notice/entities/notice_entity.dart';
import 'package:climbapp/domains/notice/entities/sub_entity/sub_entity.dart';
import 'package:climbapp/presentation/dashboard/widgets/widgets.dart';
import 'package:flutter/material.dart';

const double _marginFromAllSides = 15.0;

class SingleNotice extends StatelessWidget {
  const SingleNotice({
    this.margin = _marginFromAllSides,
    this.borderRadius = maxBorderRadius,
    super.key,
  });

  final double margin;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
        color: ColorPallete.whiteOpacity80,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
      ),
      child: const TopNoticeContainer(
        topDescription: TopDescription(
          notice: NoticeEntity(
              id: '111',
              author: 'Karol',
              authorId: '11111',
              category: 'Climbing',
              content: ContentEntity(
                  id: '11',
                  title: 'what s up aaaaaaaaaaaaaaaaaaaaaaaaaa',
                  content: loremIpsum),
              createdAt: '.10.01.2002',
              updatedAt: '10.10.10'),
        ),
      ),
    );
  }
}
