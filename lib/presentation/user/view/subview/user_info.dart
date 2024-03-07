import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:climbapp/core/l10n/l10n.dart';
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

String? _imageString = '';
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
                  textLabel: l10n.change,
                ),
                MidTextButton(
                  textLabel: 'send',
                  onTap: () async =>
                      sendImageToServer(imageFile!.path, user.id),
                )
              ],
            )
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
                ToChangeField(
                  nameController: nameController,
                  fieldName: l10n.name,
                ),
                ToChangeField(
                  nameController: ageController,
                  fieldName: l10n.age,
                  numberKeyboard: true,
                ),
                ToChangeField(
                  nameController: cityController,
                  fieldName: l10n.city,
                ),
                ToChangeField(
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
                    onTap: () => _pickImage(ImageSource.camera, quality: 10),
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

  Future<void> _pickImage(ImageSource source, {int quality = 5}) async {
    final fetchImage = await ImagePicker().pickImage(source: source);

    if (fetchImage == null) return;
    final bytes = await FlutterImageCompress.compressWithFile(fetchImage.path,
        quality: quality);
    final base64String = base64Encode(Uint8List.fromList(bytes!));
    debugPrint(base64String.length.toString());
    File fetchFile = File(fetchImage.path);
    setState(() {
      _imageString = base64String;
      imageFile = fetchFile;
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

Future<void> sendImageToServer(String filePath, String userId) async {
  debugPrint('function run');
  debugPrint(filePath);
  final request = http.MultipartRequest(
      'POST', Uri.parse('http://65.21.202.169:20119/up/upload?file=$userId'));
  request.files.add(await http.MultipartFile.fromPath(
    'image',
    filePath,
  ));
  var response = await request.send();
  final responseBody = await response.stream.bytesToString();
  debugPrint(jsonDecode(responseBody)['file']);
}
