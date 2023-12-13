part of 'network_bloc.dart';

sealed class NetworkState extends Equatable {
  const NetworkState();

  @override
  List<Object> get props => [];
}

class NetworkInitial extends NetworkState {}

class NetworkConnected extends NetworkState {}

class NetworkDisconected extends NetworkState {}
