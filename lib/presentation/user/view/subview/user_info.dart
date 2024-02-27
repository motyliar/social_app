import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/theme/colors.dart';
import 'package:climbapp/core/theme/fonts.dart';
import 'package:climbapp/core/theme/icons/icons.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/app/widgets/empty_space.dart';
import 'package:climbapp/presentation/app/widgets/gradient_divider.dart';

import 'package:climbapp/presentation/user/business/bloc/user/user_bloc.dart';
import 'package:climbapp/presentation/user/business/cubit/cubit/view_switch_cubit.dart';
import 'package:climbapp/presentation/user/business/enum.dart';
import 'package:climbapp/presentation/user/widgets/details_text_field.dart';
import 'package:climbapp/presentation/user/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

String? _imageString = '';

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc bloc) => bloc.state.user);
    TextEditingController nameController =
        TextEditingController(text: user.userName);
    TextEditingController ageController = TextEditingController(
        text: user.details?.age.toString() ?? 'Not specified');
    TextEditingController cityController =
        TextEditingController(text: user.details?.gender ?? 'M');
    TextEditingController phoneController = TextEditingController(
        text: user.details?.phone.toString() ?? '+48-000-000-000');

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: kGeneralPagesMargin, top: kGeneralPagesMargin),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: RoundButton(
              onTap: () =>
                  context.read<ViewSwitchCubit>().changeStatus(ViewStatus.main),
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
              'Change avatar',
              style: AppTextStyle.headersSmall,
            ),
            Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    radius: 60,
                    backgroundImage: _imageString != null
                        ? MemoryImage(
                            Uint8List.fromList(
                              base64Decode(
                                _imageString!,
                              ),
                            ),
                          )
                        : null),
                MidTextButton(
                  onTap: () => showImagePickerOption(context),
                  buttonWidth: 100,
                  textLabel: 'Change',
                ),
              ],
            )
          ],
        ),
        GradientDivider(
          dividerHeight: 15.0,
        ),
        ContainerTemplate(
          borderRadius: kMinBorderRadius,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(
              right: kGeneralPagesMargin, left: kGeneralPagesMargin),
          padding: const EdgeInsets.all(kGeneralPagesMargin),
          color: ColorPallete.whiteOpacity80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Edit your details', style: AppTextStyle.headersSmall),
              Divider(),
              ToChangeField(
                nameController: nameController,
                fieldName: 'Name: ',
              ),
              ToChangeField(
                nameController: ageController,
                fieldName: 'Age: ',
                numberKeyboard: true,
              ),
              ToChangeField(
                nameController: cityController,
                fieldName: 'City: ',
              ),
              ToChangeField(
                nameController: phoneController,
                fieldName: 'Phone: ',
                numberKeyboard: true,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: MidTextButton(buttonWidth: 120, textLabel: 'Confirm'))
            ],
          ),
        ),
        GradientDivider(
          dividerHeight: 15.0,
        ),
      ],
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: ColorPallete.whiteOpacity80,
        elevation: 0,
        context: context,
        builder: (builder) {
          return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _pickImage(ImageSource.gallery),
                    child: const Column(
                      children: [
                        AppIcons.gallery,
                        Text(
                          'Gallery',
                          style: AppTextStyle.descriptionMid,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _pickImage(ImageSource.camera),
                    child: const Column(
                      children: [
                        AppIcons.camera,
                        Text(
                          'Camera',
                          style: AppTextStyle.descriptionMid,
                        )
                      ],
                    ),
                  )
                ],
              ));
        });
  }

  Future<void> _pickImage(ImageSource source) async {
    final fetchImage = await ImagePicker().pickImage(source: source);
    if (fetchImage == null) return;
    final bytes = await FlutterImageCompress.compressWithFile(fetchImage.path,
        quality: 5);
    final base64String = base64Encode(Uint8List.fromList(bytes!));
    print(base64String.length);
    setState(() {
      _imageString = base64String;
    });
    Navigator.of(context).pop();
  }
}

class ToChangeField extends StatelessWidget {
  const ToChangeField({
    super.key,
    required this.nameController,
    required this.fieldName,
    this.textStyle = AppTextStyle.descriptionMid,
    this.icon = const Icon(Icons.done),
    this.numberKeyboard,
  });

  final TextEditingController nameController;
  final String fieldName;
  final TextStyle textStyle;
  final Icon icon;
  final bool? numberKeyboard;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          fieldName,
          style: textStyle,
        ),
        DetailsTextField(
          numberKeybord: numberKeyboard ?? false,
          controller: nameController,
        ),
        icon,
      ],
    );
  }
}
