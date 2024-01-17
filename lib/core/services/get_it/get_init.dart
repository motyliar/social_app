import 'package:climbapp/core/services/get_it/password_container.dart';
import 'package:climbapp/core/services/get_it/pre_app_container.dart';
import 'package:climbapp/core/services/get_it/register_container.dart';
import 'package:climbapp/core/services/get_it/sign_in_container.dart';
import 'package:climbapp/core/services/get_it/user_container.dart';

class GetItInit {
  static void initContainers() {
    passwordInit();
    registerInit();
    signInInit();
    userInit();
    preAppInit();
  }
}
