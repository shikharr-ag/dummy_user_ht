import 'package:dartz/dartz.dart';
import 'package:h_tick_test/core/failure/exception.dart';
import 'package:h_tick_test/core/failure/failure.dart';
import 'package:h_tick_test/features/open_features/users_dummy/data/datasources/user_dummy_remote_ds.dart';
import 'package:h_tick_test/features/open_features/users_dummy/domain/entities/user_dummy.dart';
import 'package:h_tick_test/features/open_features/users_dummy/domain/repository/user_dummy_repo.dart';

class UserDummyRepoImpl implements UserDummyRepo {
  final UserDummyRemoteDS userDummyRemoteDs;

  UserDummyRepoImpl({required this.userDummyRemoteDs});

  @override
  Future<Either<Failure, UserDummy>> getUserDummyFromAPI() async {
    try {
      final remoteUser = await userDummyRemoteDs.getUserData();
      return Right(remoteUser);
    } on ServerException catch (_) {
      return const Left(ServerFailure());
    }
  }
}
