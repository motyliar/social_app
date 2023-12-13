import 'dart:async';


import 'dart:developer';


import 'package:bloc/bloc.dart';


import 'package:climbapp/core/firebase/firebase_options/firebase_options.dart';


import 'package:climbapp/core/services/hive/hive_init.dart';


import 'package:climbapp/core/services/password_container.dart';


import 'package:climbapp/core/services/register_container.dart';


import 'package:climbapp/core/services/sign_in_container.dart';


import 'package:climbapp/core/services/user_container.dart';


import 'package:firebase_core/firebase_core.dart';


import 'package:flutter/widgets.dart';


class AppBlocObserver extends BlocObserver {

  const AppBlocObserver();


  @override

  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {

    super.onChange(bloc, change);


    log('onChange(${bloc.runtimeType}, $change)');

  }


  @override

  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {

    log('onError(${bloc.runtimeType}, $error, $stackTrace)');


    super.onError(bloc, error, stackTrace);

  }

}


Future<void> bootstrap(FutureOr<Widget> Function() builder) async {

  FlutterError.onError = (details) {

    log(details.exceptionAsString(), stackTrace: details.stack);

  };


  WidgetsFlutterBinding.ensureInitialized();


  try {

    await Firebase.initializeApp(

      options: DefaultFirebaseOptions.currentPlatform,

    );

  } catch (e) {

    debugPrint('Firebase initialization failed: $e');

  }


  Bloc.observer = const AppBlocObserver();


  await HiveInit().register();

  registerInit();


  signInInit();


  passwordInit();


  userInit();


  runApp(await builder());

}

