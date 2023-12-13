import 'package:climbapp/domains/password/entities/password_entity.dart';
import 'package:climbapp/domains/password/usecases/change_password_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../helpers/mockito_helpers.mocks.dart';

void main() {
  late ChangePasswordUseCase changePasswordUseCase;
  late MockPasswordRepository mockPasswordRepository;

  setUp(() {
    mockPasswordRepository = MockPasswordRepository();
    changePasswordUseCase = ChangePasswordUseCase(mockPasswordRepository);
  });

  const testResponse = 'success';

  const testPasswordEntity = PasswordEntity(
    oldPassword: 'oldPassword',
    newPassword: 'newPassword',
    userEmail: 'test@email.com',
  );

  test('Test Password UseCase', () async {
    // arrange test
    when(mockPasswordRepository.changePassword(testPasswordEntity))
        .thenAnswer((_) async => const Right(testResponse));
    // act
    final result = await changePasswordUseCase.call(testPasswordEntity);
    // expect
    expect(result, const Right<dynamic, String>(testResponse));
  });
}
