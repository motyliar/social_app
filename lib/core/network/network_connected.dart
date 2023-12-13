import 'package:climbapp/presentation/app/business/bloc/network/network_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

/// [NetworkConnectedImpl] connect to mobile by [connectionObserver] function to
/// notify do i connection in mobile, after change, send true or false to
/// [NetworkBloc]
class NetworkConnectedImpl {
  static void connectionObserver() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        NetworkBloc().add(const NetworkConnectedNotify());
      } else {
        NetworkBloc().add(const NetworkConnectedNotify(isConnected: true));
      }
    });
  }

  /// [checkConnection] pre function to check internet connection in mobile
  Future<bool> checkConnection() async {
    final connection = await Connectivity().checkConnectivity();
    if (connection == ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }

  /// [noConnection] give response to check before connect to DB
  /// if reponse is true Network disconnected
  Future<bool> get noConnection => checkConnection();
}
