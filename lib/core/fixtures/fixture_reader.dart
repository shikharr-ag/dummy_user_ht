import 'dart:io';

import 'package:h_tick_test/core/failure/exception.dart';

class FixtureReader {
  String get jsonData {
    try {
      return File('dummy_one_fixture.json').readAsStringSync();
    } catch (_) {
      throw ServerException();
    }
  }
}
