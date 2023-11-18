import 'package:dartz/dartz.dart';

import '../../../../../core/failure/failure.dart';
import '../entities/user_dummy.dart';

abstract class UserDummyRepo {
  //Function gets data from the api for user dummy
  Future<Either<Failure, UserDummy>> getUserDummyFromAPI();
}
