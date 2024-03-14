import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/presentation/app.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';
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

ScrollController _appBarController = ScrollController();

class CreateNotice extends StatelessWidget {
  const CreateNotice({super.key});
  static Route<dynamic> route() {
    return Utils.animatedRoute(
        direction: const CreateNotice(), route: routeCreateNotice);
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    return SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(
          mainChild: DashBoardApp(
            controller: _appBarController,
            imageSrc: user.profileAvatar!,
            userName: user.userName,
            isProfile: true,
          ),
          controller: _appBarController,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(kGeneralPagesMargin),
              GeneralCard(children: [
                const HeadersSmallText(text: 'Dive into sports community:'),
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
                              bottomRight: Radius.circular(kMinBorderRadius))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                            borderRadius:
                                BorderRadius.circular(kMinBorderRadius),
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            hint: const Text('Choose category'),
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MidTextButton(
                      buttonHeight: 30,
                      buttonWidth: 80,
                      textLabel: 'Buy',
                      textStyle: AppTextStyle.descriptionMid,
                    ),
                    MidTextButton(
                      buttonHeight: 30,
                      buttonWidth: 80,
                      textLabel: 'Sell',
                      textStyle: AppTextStyle.descriptionMid,
                    ),
                    MidTextButton(
                      buttonHeight: 30,
                      buttonWidth: 80,
                      textLabel: 'Partner',
                      textStyle: AppTextStyle.descriptionMid,
                    ),
                  ],
                ),
                const Gap(5),
                const GradientDivider(),
                const TextField(
                  decoration: InputDecoration(
                      hintText: 'Type what you looking for',
                      hintStyle: AppTextStyle.descriptionMid,
                      border: InputBorder.none),
                ),
                const Divider(),
                const TextField(
                  minLines: 8,
                  maxLines: 100,
                  decoration: InputDecoration(
                      hintText: '... more details',
                      hintStyle: AppTextStyle.descriptionMid,
                      border: InputBorder.none),
                ),
                const GradientDivider(),
                const Row(
                  children: [
                    Icon(Icons.photo),
                  ],
                ),
                const MidTextButton(textLabel: 'Publish'),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
