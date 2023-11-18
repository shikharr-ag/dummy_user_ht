import 'package:h_tick_test/features/open_features/users_dummy/domain/entities/user_dummy.dart';

class UserDummyModel extends UserDummy {
  const UserDummyModel(
      {required super.name, required super.age, required super.diseases});

  factory UserDummyModel.fromJson(Map<String, dynamic> map) {
    return UserDummyModel(
      name: map['name'],
      age: map['age'],
      diseases: map['diseases'],
    );
  }
}
