import 'package:dartz/dartz.dart';
import 'package:h_tick_test/core/usecases/usecase.dart';
import 'package:h_tick_test/features/open_features/users_dummy/domain/repository/user_dummy_repo.dart';

import '../../../../../core/failure/failure.dart';
import '../entities/user_dummy.dart';

class GetUserDummyUC extends UseCase<UserDummy, NoParams> {
  final UserDummyRepo userDummyRepo;

  GetUserDummyUC({required this.userDummyRepo});

  @override
  Future<Either<Failure, UserDummy>> call(NoParams params) {
    return userDummyRepo.getUserDummyFromAPI();
  }
}
