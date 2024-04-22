import 'package:climbapp/core/network/network_connected.dart';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ConnectivityMock extends Mock implements Connectivity {}

void main() {
  late ConnectivityMock mock;
  late NetworkConnectedImpl connected;

  group("checkConnection", () {
    setUp(() {
      mock = ConnectivityMock();
      connected = NetworkConnectedImpl(connectivity: mock);
    });
    test("should return true", () async {
      when(() => mock.checkConnectivity())
          .thenAnswer((_) async => Future.value(ConnectivityResult.none));
      final result = await connected.checkConnection();

      expect(result, true);
    });

    test("should return false", () async {
      when(() => mock.checkConnectivity())
          .thenAnswer((_) async => Future.value(ConnectivityResult.mobile));
      final result = await connected.checkConnection();

      expect(result, false);
    });
  });
}
