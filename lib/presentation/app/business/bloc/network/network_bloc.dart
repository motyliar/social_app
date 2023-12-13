// ignore_for_file: sort_unnamed_constructors_first

import 'package:bloc/bloc.dart';
import 'package:climbapp/core/network/network_connected.dart';
import 'package:equatable/equatable.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc._() : super(NetworkInitial()) {
    on<NetworkConnectedObserve>(_networkObserve);
    on<NetworkConnectedNotify>(_networkNotify);
  }

  static final NetworkBloc _instance = NetworkBloc._();
  // ignore: sort_constructors_first
  factory NetworkBloc() => _instance;
  void _networkObserve(
    NetworkConnectedObserve event,
    emit,
  ) {
    NetworkConnectedImpl.connectionObserver();
  }

  void _networkNotify(
    NetworkConnectedNotify event,
    Emitter<NetworkState> emit,
  ) {
    event.isConnected ? emit(NetworkConnected()) : emit(NetworkDisconected());
  }
}
