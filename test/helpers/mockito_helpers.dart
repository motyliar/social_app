import 'package:climbapp/domains/password/repository/password_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

import 'mockito_helpers.mocks.dart';
import 'mocks/mock_firebase_core.dart';

@GenerateMocks(
  [
    PasswordRepository,
    FirebaseApp,
    FirebaseAuth,
    FirebaseFirestore,
    Firebase,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
