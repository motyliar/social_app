import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:climbapp/core/constans/export_constans.dart';
import 'package:climbapp/core/datahelpers/params/image/image_params.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';
import 'package:climbapp/core/utils/helpers/helpers.dart';

import 'package:climbapp/presentation/user/business/cubit/image_sender/image_sender_cubit.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';

import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';

import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/business/cubit/cubit/view_switch_cubit.dart';
import 'package:climbapp/presentation/user/business/enum.dart';

import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

// String? _imageString = '';
late File? imageFile;

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final user = context.select((UserBloc bloc) => bloc.state.user);
    TextEditingController nameController =
        TextEditingController(text: user.userName);
    TextEditingController ageController = TextEditingController(
        text: user.details?.age.toString() ?? 'Not specified');
    TextEditingController cityController =
        TextEditingController(text: user.details?.gender ?? 'M');
    TextEditingController phoneController = TextEditingController(
        text: user.details?.phone.toString() ?? '+48-000-000-000');

    return BlocProvider(
        create: (context) => userLocator<ImageSenderCubit>(),
        child: Column(
          children: [
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(user.profileAvatar!),
                      ),
                    ]),
                MidTextButton(
                  onTap: () => showImagePickerOption(
                      context, () async => _pickImage(ImageSource.gallery)),
                  buttonWidth: 100,
                  textLabel: l10n.change,
                ),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, userBloc) {
                    return BlocBuilder<ImageSenderCubit, ImageSenderState>(
                      builder: (context, state) {
                        return MidTextButton(
                            textLabel: 'send',
                            onTap: () async => {
                                  context
                                      .read<ImageSenderCubit>()
                                      .sendRequest(ImageParams(
                                        filePath: imageFile!.path,
                                        userId: user.id,
                                        url: AppUrl.uploadImageURL(
                                          user.id,
                                        ),
                                      )),
                                  BlocProvider.of<UserBloc>(context).add(
                                    LoadUserEvent(
                                      user: GetUserParams(
                                          token: '00', userId: user.id),
                                    ),
                                  ),
                                });
                      },
                    );
                  },
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
                        Text(l10n.detailsTitle,
                            style: AppTextStyle.headersSmall),
                        const Divider(),
                        EditingTextField(
                          nameController: nameController,
                          fieldName: l10n.name,
                        ),
                        EditingTextField(
                          nameController: ageController,
                          fieldName: l10n.age,
                          numberKeyboard: true,
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
                                buttonWidth: 120, textLabel: l10n.confirm))
                      ],
                    ),
                  ),
                ),
                const GradientDivider(
                  dividerHeight: kMidDividerHeight,
                ),
              ],
            )
          ],
        ));
  }

  Future<void> _pickImage(ImageSource source, {int quality = 5}) async {
    final fetchImage = await ImagePicker().pickImage(source: source);

    if (fetchImage == null) return;
    final bytes = await FlutterImageCompress.compressWithFile(fetchImage.path,
        quality: quality);
    final base64String = base64Encode(Uint8List.fromList(bytes!));
    debugPrint(base64String.length.toString());
    File fetchFile = File(fetchImage.path);
    setState(() {
      imageFile = fetchFile;
    });
    Navigator.of(context).pop();
  }
}
