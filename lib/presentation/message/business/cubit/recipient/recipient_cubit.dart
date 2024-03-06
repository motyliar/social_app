import 'package:bloc/bloc.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

part 'recipient_state.dart';

class RecipientCubit extends Cubit<RecipientState> {
  RecipientCubit() : super(const RecipientState());

  void addRecipient(FriendsEntity recipient) {
    emit(state.copyWith(recipient: recipient));
  }
}
