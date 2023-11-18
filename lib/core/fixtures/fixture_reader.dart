import 'dart:io';

import 'package:h_tick_test/core/failure/exception.dart';

class FixtureReader {
  String jsonData() {
    try {
      return File(
              'C:/Users/Shikhar Agarwal/Flutter Projects/h_tick_test/lib/core/fixtures/dummy_one_fixture.json')
          .readAsStringSync();
    } catch (_) {
      print('Some error');
      throw ServerException();
    }
  }
}
