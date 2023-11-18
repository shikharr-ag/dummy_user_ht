import 'package:equatable/equatable.dart';

class UserDummy extends Equatable {
  final String name;
  final num age;
  final List<String> diseases;

  const UserDummy(
      {required this.name, required this.age, required this.diseases});

  @override
  List<Object?> get props => [name, age, diseases];
}
