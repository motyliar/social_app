part of 'network_bloc.dart';

sealed class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

class NetworkConnectedNotify extends NetworkEvent {
  const NetworkConnectedNotify({this.isConnected = false});
  final bool isConnected;
  @override
  List<Object> get props => [isConnected];
}

class NetworkConnectedObserve extends NetworkEvent {}
