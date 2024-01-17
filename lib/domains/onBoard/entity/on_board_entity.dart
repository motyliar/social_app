import 'package:equatable/equatable.dart';

class OnBoardEntity extends Equatable {
  const OnBoardEntity({required this.wasOpened});
  final bool wasOpened;
  @override
  List<Object> get props => [wasOpened];
  @override
  String toString() => wasOpened.toString();
}
