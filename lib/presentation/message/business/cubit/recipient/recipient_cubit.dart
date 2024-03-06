import 'package:bloc/bloc.dart';
import 'package:climbapp/domains/friends/entities/friends_entity.dart';
import 'package:climbapp/domains/user/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

part 'recipient_state.dart';

class RecipientCubit extends Cubit<RecipientState> {
  RecipientCubit() : super(const RecipientState());

  Future<void> addRecipient(FriendsEntity recipient) async {
    emit(state.copyWith(recipient: recipient));
  }
}
