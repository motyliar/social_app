import 'package:climbapp/core/error/error_screen.dart';
import 'package:climbapp/core/services/get_it/register_container.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/core/utils/validation/validations.dart';
import 'package:climbapp/domains/register/entites/register_entites.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/register/business/bloc/user_register/user_register_bloc.dart';
import 'package:climbapp/presentation/register/widget/register_textfield_column.dart';
import 'package:climbapp/presentation/sign_in/view/widgets.dart';
import 'package:flutter/material.dart';
import '../../app.dart';
import '../../../core/constans/export_constans.dart';

TextEditingController _nameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
TextEditingController _rePasswordController = TextEditingController();
const double _marginFromTop = 0.15;
const double _middleCardpercentOfAppHigh = 0.5;
const double _sizedBixPercentOfHeight = 0.55;
const double _widthOfTopLabel = 120;

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeRegisterPage),
      builder: (_) => RegisterPage(),
    );
  }

  final _registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final double mobileHeight = MediaQuery.of(context).size.height;
    final double mobileWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => registerLocator<UserRegisterBloc>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: mobileWidth,
            height: mobileHeight,
            child: BlocConsumer<UserRegisterBloc, UserRegisterState>(
              listener: (context, state) {
                if (state is ServerFailure) {
                  Navigator.push(
                    context,
                    MaterialPageRoute<ErrorScreen>(
                      builder: (context) => const ErrorScreen(
                        error: 'server failure',
                      ),
                    ),
                  );
                }
                if (state is UserRegisterLoaded) {
                  Utils.customSnackBarWarning(
                    context: context,
                    message: l10n.successMsg,
                  );
                  context
                      .read<UserRegisterBloc>()
                      .add(AddUserToMongoDB(newUser: state.user));
                  Navigator.popUntil(context, (route) => route.isFirst);
                }
                if (state is UserRegisterFailure) {
                  final message = Utils().toastExceptionFirebaseMessage(
                    exceptionMessage: state.exceptionMessage,
                    context: context,
                  );
                  Utils.customSnackBarWarning(
                      message: message, context: context);
                }
              },
              builder: (context, state) {
                return Form(
                  key: _registerKey,
                  child: Stack(
                    children: [
                      backgroundPainterWidget(
                          size: Size(mobileWidth, mobileHeight)),
                      const TopBackgroundImage(),
                      Positioned(
                        top: mobileWidth * _marginFromTop,
                        child: TopLabels(
                          bigLabelText: l10n.topbigLabelText,
                          descriptionLabelText: l10n.descriptionLabelText,
                        ),
                      ),
                      const ArrowBack(),
                      const BottomBackgroundBar(),
                      Positioned(
                        top: kMarginToStartMiddleForm,
                        child: SizedBox(
                          height: mobileHeight * _sizedBixPercentOfHeight,
                          child: Stack(children: [
                            MainStackCard(
                              appWidth: mobileWidth,
                              appHeight: mobileHeight,
                              heightMultipler: _middleCardpercentOfAppHigh,
                            ),
                            Positioned(
                              top: 0,
                              child: StackCenter(
                                  appWidth: mobileWidth,
                                  widgetWidth: _widthOfTopLabel,
                                  child: MidTextButton(
                                      buttonWidth: _widthOfTopLabel,
                                      textLabel: l10n.signUpLabel)),
                            ),
                            Positioned(
                              top: kTextFieldsStartMarginFromTop,
                              child: StackCenter(
                                appWidth: mobileWidth,
                                widgetWidth: mobileWidth * kMarginMultiplier,
                                child: RegisterTextFieldStack(
                                  mobileWidth: mobileWidth,
                                  l10n: l10n,
                                  nameController: _nameController,
                                  emailController: _emailController,
                                  passwordController: _passwordController,
                                  rePasswordController: _rePasswordController,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: StackCenter(
                                appWidth: mobileWidth,
                                widgetWidth: 90,
                                child: RoundButton(
                                    onTap: () => FormValidation.onFormValidate(
                                          key: _registerKey,
                                          action: () => context
                                              .read<UserRegisterBloc>()
                                              .add(
                                                AddUserToFireBaseEvent(
                                                  newUser: RegisterEntites(
                                                    id: kEmptyValue,
                                                    userEmail:
                                                        _emailController.text,
                                                    userName:
                                                        _nameController.text,
                                                    password:
                                                        _passwordController
                                                            .text,
                                                  ),
                                                ),
                                              ),
                                        ),
                                    icon: Icons.app_registration,
                                    iconSize: 40,
                                    width: 90),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
