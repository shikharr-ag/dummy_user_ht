import 'dart:convert';

import 'package:h_tick_test/core/dummy_api/dummy_api.dart';
import 'package:h_tick_test/features/open_features/users_dummy/data/models/user_dummy_model.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/failure/exception.dart';

abstract class UserDummyRemoteDS {
  /// Calls the Dummy Api Call
  ///
  /// Throws a [ServerException] for all error codes.
  Future<UserDummyModel> getUserData();
}

class UserDummyRemoteDSImpl implements UserDummyRemoteDS {
  final http.Client? client;

  UserDummyRemoteDSImpl({this.client});
  @override
  Future<UserDummyModel> getUserData() async {
    try {
      ///Manually throw error to create dummy exception
      // throw ServerException();

      ///Dummy api to get data
      return UserDummyModel.fromJson(
          jsonDecode(await DummyApi().getEncodedJsonStringDataFromApi()));
    } on ServerException catch (_) {
      print('Error user');
      throw ServerException();
    }
  }
}
