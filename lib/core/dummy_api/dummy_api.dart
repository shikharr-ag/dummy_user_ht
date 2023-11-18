import 'package:h_tick_test/core/fixtures/fixture_reader.dart';

class DummyApi {
  Future<String> getEncodedJsonStringDataFromApi() {
    return Future.delayed(Duration(milliseconds: 200)).then((value) {
      return FixtureReader().jsonData();
    });
  }
}
