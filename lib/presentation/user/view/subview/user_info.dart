import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/image/image_params.dart';
import 'package:climbapp/core/datahelpers/params/sports/get_sports_params.dart';
import 'package:climbapp/core/datahelpers/params/user/user_params.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/services/get_it/sport_container.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';
import 'package:climbapp/presentation/app/widgets/loading_state.dart';
import 'package:climbapp/presentation/user/business/cubit/image_sender/image_sender_cubit.dart';
import 'package:climbapp/presentation/user/business/cubit/load_sport/load_sport_cubit.dart';

import 'package:climbapp/presentation/user/business/logic/user_logic.dart';

import 'package:climbapp/core/theme/themes_export.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';

import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';

import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/business/cubit/view_switch/view_switch_cubit.dart';
import 'package:climbapp/presentation/user/business/enum.dart';

import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

// todo sprawdzić błędy

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final user = context.select((UserBloc bloc) => bloc.state.user);
    TextEditingController nameController =
        TextEditingController(text: user.userName);
    TextEditingController ageController =
        TextEditingController(text: user.details?.age.toString());
    TextEditingController cityController =
        TextEditingController(text: user.details?.gender);
    TextEditingController phoneController =
        TextEditingController(text: user.details?.phone.toString());

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => userLocator<ImageSenderCubit>(),
          ),
        ],
        child: Column(
          children: [
            BlocBuilder<LoadSportCubit, LoadSportState>(
              builder: (context, state) {
                if (state is LoadSportLoading) {
                  return const LoadingPage();
                }
                return Text(state.sports.getValue(0).toString());
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: kGeneralPagesMargin, top: kGeneralPagesMargin),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: RoundButton(
                  onTap: () => context
                      .read<ViewSwitchCubit>()
                      .changeStatus(ViewStatus.main),
                  icon: Icons.arrow_back,
                  iconSize: 20,
                  width: 50,
                ),
              ),
            ),
            const EmptySpace(),
            UserViewCard(
              children: [
                Text(
                  l10n.changeAvatar,
                  style: AppTextStyle.headersSmall,
                ),
                const Divider(),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<UserBloc, UserState>(
                        builder: (context, state) {
                          if (state is UserLoading) {
                            return const LoadingPage();
                          }
                          if (state is LoadingFailed) {
                            return const Center(
                              child: Text('Error'),
                            );
                          }
                          if (state is UserLoaded) {
                            return CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  NetworkImage(state.user.profileAvatar!),
                            );
                          } else {
                            return const LoadingPage();
                          }
                        },
                      ),
                      Column(
                        children: [
                          BlocBuilder<ImageSenderCubit, ImageSenderState>(
                            builder: (context, state) {
                              return MidTextButton(
                                onTap: () async => {
                                  showImagePickerOption(context, () async {
                                    await UserLogic.pickFileFromMobile(
                                            ImageSource.gallery,
                                            context: context)
                                        .then((value) async => {
                                              await context
                                                  .read<ImageSenderCubit>()
                                                  .pickFile(value)
                                                  .then((value) =>
                                                      Navigator.of(context)
                                                          .pop()),
                                            });
                                  }),
                                },
                                buttonWidth: 150,
                                textLabel: l10n.change,
                              );
                            },
                          ),
                          BlocBuilder<ImageSenderCubit, ImageSenderState>(
                            builder: (context, state) {
                              return MidTextButton(
                                buttonWidth: 150,
                                textLabel: l10n.sendPageTop,
                                onTap: () async => {
                                  state.imageFile != null
                                      ? null
                                      : Future.delayed(
                                          const Duration(milliseconds: 50),
                                          () async => await context
                                              .read<ImageSenderCubit>()
                                              .sendRequest(
                                                ImageParams(
                                                  filePath:
                                                      state.imageFile!.path,
                                                  userId: user.id,
                                                  url: AppUrl.uploadImageURL(
                                                    user.id,
                                                  ),
                                                ),
                                              ),
                                        ),
                                  BlocProvider.of<UserBloc>(context).add(
                                    LoadUserEvent(
                                      user: GetUserParams(
                                          token: '00', userId: user.id),
                                    ),
                                  ),
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ]),
              ],
            ),
            const GradientDivider(
              dividerHeight: 15.0,
            ),
            ContainerTemplate(
              borderRadius: kMinBorderRadius,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  right: kGeneralPagesMargin, left: kGeneralPagesMargin),
              padding: const EdgeInsets.all(kGeneralPagesMargin),
              color: ColorPallete.whiteOpacity80,
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.detailsTitle, style: AppTextStyle.headersSmall),
                    const Divider(),
                    EditingTextField(
                      nameController: nameController,
                      fieldName: l10n.name,
                    ),
                    EditingTextField(
                      nameController: ageController,
                      fieldName: l10n.age,
                      numberKeyboard: true,
                      hintText: 'Not specified',
                    ),
                    EditingTextField(
                      nameController: cityController,
                      fieldName: l10n.city,
                    ),
                    EditingTextField(
                      nameController: phoneController,
                      fieldName: l10n.phone,
                      numberKeyboard: true,
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: MidTextButton(
                            onTap: () => BlocProvider.of<UserBloc>(context)
                                    .add(UpdatingUser(
                                  params: UpdatingUserParams(
                                    url: AppUrl.updateUser(user.id),
                                    update: UserUpdateData(
                                        name: nameController.text,
                                        age: int.parse(ageController.text),
                                        city: cityController.text,
                                        phone: phoneController.text),
                                  ),
                                )),
                            buttonWidth: 120,
                            textLabel: l10n.confirm))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
