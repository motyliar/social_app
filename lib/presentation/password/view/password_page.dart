import 'package:climbapp/core/constans/app_sizing_const.dart';
import 'package:climbapp/core/constans/router_constans.dart';
import 'package:climbapp/core/l10n/l10n.dart';
import 'package:climbapp/core/services/get_it/password_container.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/presentation/app/widgets/app_widgets.dart';
import 'package:climbapp/presentation/password/business/cubit/password_cubit.dart';
import 'package:climbapp/presentation/password/widgets/widgets.dart';
import 'package:climbapp/presentation/sign_in/view/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const double _marginFromTop = 0.15;

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routePasswordPage),
      builder: (_) => const PasswordPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final mobileWidth = MediaQuery.of(context).size.width;
    final mobileHeight = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => passwordLocator<PasswordCubit>(),
      child: BlocConsumer<PasswordCubit, PasswordState>(
        listener: (context, state) {
          if (state is PasswordSuccess) {
            Navigator.pushNamed(context, routeSignInPage);
          }
          if (state is PasswordFailed) {
            context.read<PasswordCubit>().clearState();
            if (state.exceptionMessage != '') {
              Utils.showToastMessage(
                message: Utils().toastExceptionFirebaseMessage(
                  exceptionMessage: state.exceptionMessage,
                  context: context,
                ),
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
            child: SizedBox(
              width: mobileWidth,
              height: mobileHeight,
              child: Stack(children: [
                BackgroundPainterWidget(size: Size(mobileWidth, mobileHeight)),
                const TopBackgroundImage(),
                Positioned(
                  top: mobileWidth * _marginFromTop,
                  child: TopLabels(
                    bigLabelText: l10n.topbigLabelText,
                    descriptionLabelText: l10n.descriptionLabelText,
                  ),
                ),
                Positioned(
                  top: kMarginToStartMiddleForm,
                  child: SizedBox(
                    height: mobileHeight * 0.40,
                    child: PasswordMiddleCard(
                        mobileWidth: mobileWidth, mobileHeight: mobileHeight),
                  ),
                ),
                const BottomBackgroundBar(),
                const ArrowBack(),
              ]),
            ),
          ));
        },
      ),
    );
  }
}
