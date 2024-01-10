import 'dart:async';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:climbapp/core/services/firebase/firebase_init.dart';
import 'package:climbapp/core/services/get_it/get_init.dart';
import 'package:climbapp/core/services/hive/hive_init.dart';

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
  FireBaseInit().init();

  Bloc.observer = const AppBlocObserver();

  await HiveInit().init();
  GetItInit.initContainers();

  runApp(await builder());
}
