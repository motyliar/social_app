import 'dart:convert';

import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/data/register/models/register_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

abstract class RegisterRemoteDataSources {
  Future<RegisterModel> createDBUser(RegisterModel newUser);
  Future<RegisterModel> createNewFireBaseUser(
    RegisterModel newUser,
  );
}

class RegisterRemoteDataSourcesImpl extends RegisterRemoteDataSources {
  RegisterRemoteDataSourcesImpl({required this.client});
  final http.Client client;

  @override
  Future<RegisterModel> createDBUser(RegisterModel newUser) async {
    final response = await client.post(
      Uri.parse(AppUrl.authApi('register')),
      headers: AppUrl.contentHeaders,
      body: jsonEncode(
        {
          'userAuthID': newUser.id,
          'userName': newUser.userName,
          'userEmail': newUser.userEmail,
        },
      ),
    );
    if (response.statusCode == 200) {
      return newUser;
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<RegisterModel> createNewFireBaseUser(RegisterModel newUser) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: newUser.userEmail,
        password: newUser.password,
      );
      final user = userCredential.user;
      final resultUser = RegisterModel(
        user!.uid,
        newUser.userName,
        user.email!,
        newUser.password,
      );
      return resultUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw NetworkException(e.code);
      }
      if (e.code == 'weak-password') {
        throw NetworkException(e.code);
      }
      if (e.code == 'operation-not-allowed') {
        throw NetworkException('Something wrong');
      }
      if (e.code == 'email-already-in-use') {
        throw NetworkException('E-mail already in use');
      }
      throw NetworkException('Something goes wrong');
    }
  }
}
