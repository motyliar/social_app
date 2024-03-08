part of 'image_sender_cubit.dart';

class ImageSenderState extends Equatable {
  const ImageSenderState({this.responseMessage, this.imageFile});
  final String? responseMessage;
  final File? imageFile;

  ImageSenderState copyWith({String? responseMessage, File? imageFile}) =>
      ImageSenderState(
        responseMessage: responseMessage ?? this.responseMessage,
        imageFile: imageFile ?? this.imageFile,
      );

  @override
  List<Object?> get props => [responseMessage, imageFile];
}

class ImageSenderFailed extends ImageSenderState {}
