import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notice/entities/sub_entity/sub_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/create_notice/business/cubit/publish_notice/publish_notice_cubit.dart';
import 'package:climbapp/presentation/create_notice/widgets/widgets.dart';
import 'package:climbapp/presentation/dashboard/widgets/widgets.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constans/export_constans.dart';
import '../../../domains/notice/entities/notice_enums/exports.dart';

// todo create animation beetween pages!
// need to made single function to handle all animations
// todo create function to change value on dropdownbutton
// create textfields to subject and to content
// add photo function

// todo need to add notice params to send

ScrollController _appBarController = ScrollController();
TextEditingController _subjectController = TextEditingController();
TextEditingController _contentController = TextEditingController();

class CreateNotice extends StatelessWidget {
  const CreateNotice({super.key});
  static Route<dynamic> route() {
    return Utils.animatedRoute(
        direction: const CreateNotice(), route: routeCreateNotice);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    final l10n = context.l10n;
    return BlocProvider(
      create: (context) => userLocator<PublishNoticeCubit>(),
      child: SafeArea(
        child: Scaffold(
          appBar: DashboardAppBar(
            mainChild: DashBoardApp(
              isSearchBar: false,
              controller: _appBarController,
              imageSrc: user.profileAvatar!,
              userName: user.userName,
              isProfile: true,
            ),
            controller: _appBarController,
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              const Gap(30),
              GeneralCard(
                children: [
                  HeadersSmallText(text: l10n.create_page_label),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HeadersSmallText(text: 'Category:'),
                      Container(
                        width: 150,
                        decoration: const BoxDecoration(
                            color: ColorPallete.mainDecorationColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(kMinBorderRadius),
                                bottomRight:
                                    Radius.circular(kMinBorderRadius))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              borderRadius:
                                  BorderRadius.circular(kMinBorderRadius),
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              hint: Text(l10n.categoryLabel),
                              style: AppTextStyle.descriptionMid,
                              dropdownColor: Colors.white.withOpacity(0.5),
                              elevation: 0,
                              icon: const Icon(
                                Icons.add,
                                color: ColorPallete.pinkDecorationColor,
                                size: 28,
                              ),
                              items: const [
                                DropdownMenuItem<String>(
                                  value: 'climbing',
                                  child: MidTextButton(
                                    textLabel: 'Climbing',
                                    textStyle: AppTextStyle.descriptionBigger,
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'football',
                                  child: Text('Football'),
                                ),
                              ],
                              onChanged: (value) => value = 'hello'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TypeButton(text: l10n.typeFirst),
                        TypeButton(text: l10n.typeSecond),
                        TypeButton(text: l10n.typeThird)
                      ]),
                  const Gap(5),
                  const GradientDivider(),
                  Form(
                      child: Column(
                    children: [
                      TextFormField(
                        controller: _subjectController,
                        decoration: InputDecoration(
                            hintText: l10n.subjectHint,
                            hintStyle: AppTextStyle.descriptionMid,
                            border: InputBorder.none),
                      ),
                      const Divider(),
                      TextFormField(
                          minLines: 8,
                          maxLines: 100,
                          controller: _contentController,
                          decoration: InputDecoration(
                              hintText: l10n.contentHint,
                              hintStyle: AppTextStyle.descriptionMid,
                              border: InputBorder.none)),
                      const GradientDivider(),
                      const Row(
                        children: [
                          Icon(Icons.photo),
                        ],
                      ),
                      BlocBuilder<PublishNoticeCubit, PublishNoticeState>(
                        builder: (context, state) {
                          return MidTextButton(
                              onTap: () => context
                                  .read<PublishNoticeCubit>()
                                  .sendNotice(
                                    CreateNoticeParams.send(
                                      AppUrl.createNoticeURL(),
                                      sendNotice(
                                        author: user.userName,
                                        authorId: user.id,
                                        category: NoticeCategory.climbing,
                                        avatar: user.profileAvatar!,
                                        type: ActionType.partner,
                                        content: ContentEntity(
                                            id: '',
                                            title: _subjectController.text,
                                            content: _contentController.text),
                                      ),
                                    ),
                                  ),
                              textLabel: l10n.publishButton);
                        },
                      ),
                    ],
                  )),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

// todo dodać lokalizację gdzie co i jak żeby można było filtrować
Map<String, dynamic> sendNotice(
    {required String author,
    required String authorId,
    required NoticeCategory category,
    required String avatar,
    required ActionType type,
    required ContentEntity content,
    String? image,
    String? localization}) {
  return {
    'notice': {
      'author': author,
      'authorId': authorId,
      'category': category.name,
      'content': {
        'title': content.title,
        'content': content.content,
        'when': '23.04.2024',
      },
      'avatar': avatar,
      'type': type.name,
      'image': image,
      'localization': localization ?? '',
    }
  };
}
