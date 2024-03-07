part of 'image_sender_cubit.dart';

class ImageSenderState extends Equatable {
  const ImageSenderState({this.responseMessage});
  final String? responseMessage;

  @override
  List<Object?> get props => [responseMessage];
}

class ImageSenderFailed extends ImageSenderState {}
