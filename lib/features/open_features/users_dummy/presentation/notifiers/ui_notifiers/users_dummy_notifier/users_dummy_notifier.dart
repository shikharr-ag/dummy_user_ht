import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:h_tick_test/core/usecases/usecase.dart';
import 'package:h_tick_test/features/open_features/users_dummy/data/datasources/user_dummy_remote_ds.dart';
import 'package:h_tick_test/features/open_features/users_dummy/data/repositories/user_dummy_repo_impl.dart';
import 'package:h_tick_test/features/open_features/users_dummy/domain/usecase/user_dummy_repo_uc.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/failure/exception.dart';
import '../../../../../../../core/failure/failure.dart';
import '../../../../data/models/user_dummy_model.dart';
import '../../../../domain/entities/user_dummy.dart';

enum MyState { noError, error, loading, initial }

class UsersDummyNotifiers extends ChangeNotifier {
  UserDummy? _model;
  UserDummy? get model => _model;
  MyState _state = MyState.initial;
  MyState get state => _state;
  String _errMsg = '';
  String get errMsg => _errMsg;

  void setUserDummyModel(UserDummy m) {
    _model = m;
    notifyListeners();
  }

  void resetModel() {
    _model = null;
    notifyListeners();
  }

  void setErrMsg(String msg) {
    _errMsg = msg;
    notifyListeners();
  }

  void setMyState(MyState s) {
    _state = s;
    notifyListeners();
  }

  void getUserDummyData() async {
    Either<Failure, UserDummy>? eitherModel;

    resetModel();
    setMyState(MyState.loading);
    eitherModel = await GetUserDummyUC(
        userDummyRepo: UserDummyRepoImpl(
            userDummyRemoteDs: UserDummyRemoteDSImpl()))(NoParams());
    eitherModel.fold((failure) {
      setMyState(MyState.error);
      setErrMsg(failure.message);
    }, (dummy) {
      setMyState(MyState.noError);
      setUserDummyModel(dummy);
    });
  }
}
