part of 'view_switch_cubit.dart';


sealed class ViewSwitchState extends Equatable {

  ViewSwitchState();


  @override

  List<Object> get props => [];

}


final class ViewSwitchInitial extends ViewSwitchState {}


class ViewSwitchSettings extends ViewSwitchState {}


class ViewSwitchInfo extends ViewSwitchState {}


class ViewSwitchSport extends ViewSwitchState {}


class ViewSwitchNotice extends ViewSwitchState {}

