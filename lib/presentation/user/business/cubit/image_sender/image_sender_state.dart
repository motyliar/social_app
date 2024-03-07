part of 'image_sender_cubit.dart';

class ImageSenderState extends Equatable {
  const ImageSenderState({this.responseMessage, this.imageFile});
  final String? responseMessage;
  final File? imageFile;

  @override
  List<Object?> get props => [responseMessage, imageFile];
}

class ImageSenderFailed extends ImageSenderState {}
