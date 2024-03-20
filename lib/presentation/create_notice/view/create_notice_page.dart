import 'package:climbapp/core/datahelpers/params/notice/notice_params.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notice/entities/sub_entity/sub_entity.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
import 'package:climbapp/presentation/create_notice/business/cubit/publish_notice/publish_notice_cubit.dart';
import 'package:climbapp/presentation/create_notice/business/cubit/user_data/user_notice_data_cubit.dart';
import 'package:climbapp/presentation/create_notice/business/logic/create_notice.dart';
import 'package:climbapp/presentation/create_notice/business/logic/datePicker.dart';
import 'package:climbapp/presentation/create_notice/business/logic/drop_menu_generator.dart';
import 'package:climbapp/presentation/create_notice/widgets/widgets.dart';
import 'package:climbapp/presentation/dashboard/widgets/widgets.dart';
import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constans/export_constans.dart';

// todo create animation beetween pages!
// need to made single function to handle all animations
// todo create function to change value on dropdownbutton
// create textfields to subject and to content
// add photo function

// todo need to add notice params to send

ScrollController _appBarController = ScrollController();
TextEditingController _subjectController = TextEditingController();
TextEditingController _contentController = TextEditingController();
TextEditingController _localizationController = TextEditingController();

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userLocator<PublishNoticeCubit>(),
        ),
        BlocProvider(
          create: (context) => UserNoticeDataCubit(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorPallete.scaffoldBackground,
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
                      HeadersSmallText(text: l10n.categoryLabel),
                      Container(
                        width: 150,
                        decoration: const BoxDecoration(
                            color: ColorPallete.mainDecorationColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(kMinBorderRadius),
                                bottomRight:
                                    Radius.circular(kMinBorderRadius))),
                        child: BlocBuilder<UserNoticeDataCubit,
                            UserNoticeDataState>(
                          builder: (context, state) {
                            return DropdownButtonHideUnderline(
                              child: DropdownButton(
                                borderRadius:
                                    BorderRadius.circular(kMinBorderRadius),
                                padding:
                                    const EdgeInsets.only(left: 10, right: 5),
                                hint: Text(l10n.categoryLabel),
                                value: state.category,
                                style: AppTextStyle.descriptionMid,
                                dropdownColor: Colors.white.withOpacity(0.5),
                                elevation: 0,
                                icon: const Icon(
                                  Icons.add,
                                  color: ColorPallete.pinkDecorationColor,
                                  size: 28,
                                ),
                                items: generateMenu(),
                                onChanged: (value) => context
                                    .read<UserNoticeDataCubit>()
                                    .changeCategory(value),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          controller: _localizationController,
                          style: AppTextStyle.descriptionBigger,
                          decoration: InputDecoration(
                              hintText: l10n.questionWhere,
                              hintStyle: AppTextStyle.descriptionMid,
                              border: InputBorder.none),
                        ),
                      ),
                      BlocBuilder<UserNoticeDataCubit, UserNoticeDataState>(
                        builder: (context, state) {
                          return TextButton(
                            onPressed: () async {
                              final date = await showDate(context);
                              Future.delayed(
                                  const Duration(milliseconds: 200),
                                  () => context
                                      .read<UserNoticeDataCubit>()
                                      .changeData(
                                          date.toString().isTooLong(10)));
                            },
                            child: Text(
                              state.date.isTooLong(10),
                              style: AppTextStyle.headersSmall,
                            ),
                          );
                        },
                      )
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
                        maxLength: 40,
                        controller: _subjectController,
                        style: AppTextStyle.descriptionBigger,
                        decoration: InputDecoration(
                            hintText: l10n.subjectHint,
                            hintStyle: AppTextStyle.descriptionMid,
                            border: InputBorder.none),
                      ),
                      const Divider(),
                      TextFormField(
                          minLines: 6,
                          maxLines: 100,
                          style: AppTextStyle.descriptionBigger,
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
                          final noticeData = context.select(
                              (UserNoticeDataCubit cubit) => cubit.state);

                          return MidTextButton(
                              onTap: () => context
                                  .read<PublishNoticeCubit>()
                                  .sendNotice(
                                    CreateNoticeParams.send(
                                      AppUrl.createNoticeURL(),
                                      sendNotice(
                                        author: user.userName,
                                        authorId: user.id,
                                        category: noticeData.category,
                                        avatar: user.profileAvatar!,
                                        type: noticeData.type,
                                        content: ContentEntity(
                                            id: '',
                                            title: _subjectController.text,
                                            content: _contentController.text,
                                            when:
                                                noticeData.date.isTooLong(10)),
                                        localization:
                                            _localizationController.text,
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
