import 'dart:convert';
import 'package:climbapp/core/constans/url_constans.dart';
import 'package:climbapp/core/error/exceptions/exceptions.dart';
import 'package:climbapp/data/sign_in/models/sign_in_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class SignInRemoteDataSources {
  Future<String> loginAction(SignInModel user);
  Future<Either<Exception, SignInModel>> catchUserToken(SignInModel user);
}

class SignInRemoteDataSourcesImpl extends SignInRemoteDataSources {
  SignInRemoteDataSourcesImpl({required this.client});
  final http.Client client;
  @override
  Future<String> loginAction(SignInModel user) async {
    print('funkcja logowania');
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: user.email, password: user.password);
    final userID = credential.user!.uid;
    debugPrint('this is :$userID');
    return userID;
  }

  @override
  Future<Either<Exception, SignInModel>> catchUserToken(
      SignInModel user) async {
    final response = await client.post(
      Uri.parse(
        AppUrl.authApi('login'),
      ),
      headers: AppUrl.contentHeaders,
      body: jsonEncode(
        AppUrl.loginMap(userEmail: user.email, userID: user.password),
      ),
    );
    print('RESPOSNSE STATUS: ${response.statusCode}');
    if (response.statusCode == 200) {
      print('RESPOSNSE BODY: ${response.body}');
      final userModel = SignInModel.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
      return Right(userModel);
    } else if (response.statusCode == 400) {
      return Left(
        ServerException.errorMessage(responseBody: response.body),
      );
    } else if (response.statusCode == 401) {
      return Left(ServerException.errorMessage(responseBody: response.body));
    } else {
      throw Exception(response.body);
    }
  }
}
