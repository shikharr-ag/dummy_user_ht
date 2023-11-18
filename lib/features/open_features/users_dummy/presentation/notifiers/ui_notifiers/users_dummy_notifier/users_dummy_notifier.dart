import 'package:flutter/material.dart';
import 'package:h_tick_test/features/open_features/users_dummy/data/datasources/user_dummy_remote_ds.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/failure/exception.dart';
import '../../../../data/models/user_dummy_model.dart';

enum MyState { noError, error }

class UsersDummyNotifiers extends ChangeNotifier {
  UserDummyModel? _model;
  UserDummyModel? get model => _model;
  MyState _state = MyState.noError;

  MyState get state => _state;

  void setUserDummyModel(UserDummyModel m) {
    _model = m;
    notifyListeners();
  }

  void setMyState(MyState s) {
    _state = s;
    notifyListeners();
  }

  void getUserDummyData() async {
    try {
      setMyState(MyState.noError);
      final model = await UserDummyRemoteDSImpl().getUserData();
      setUserDummyModel(model);
    } on ServerException catch (_) {
      setMyState(MyState.error);
    }
  }
}
