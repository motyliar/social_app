import 'package:climbapp/domains/password/entities/password_entity.dart';

class PasswordModel extends PasswordEntity {
  const PasswordModel(
    String oldPassword,
    String newPassword,
    String userEmail,
  ) : super(
          oldPassword: oldPassword,
          newPassword: newPassword,
          userEmail: userEmail,
        );

  factory PasswordModel.toEntity({required PasswordEntity passwordEntity}) {
    return PasswordModel(
      passwordEntity.oldPassword,
      passwordEntity.newPassword,
      passwordEntity.userEmail,
    );
  }

  PasswordEntity toEntity() {
    return PasswordEntity(
      oldPassword: oldPassword,
      newPassword: newPassword,
      userEmail: userEmail,
    );
  }

  @override
  List<Object> get props => [oldPassword, newPassword, userEmail];
}
