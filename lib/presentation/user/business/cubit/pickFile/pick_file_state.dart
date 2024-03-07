part of 'pick_file_cubit.dart';

class PickFileState extends Equatable {
  const PickFileState({this.imageFile});
  final File? imageFile;

  @override
  List<Object?> get props => [imageFile];
}

final class PickFileFailed extends PickFileState {}
