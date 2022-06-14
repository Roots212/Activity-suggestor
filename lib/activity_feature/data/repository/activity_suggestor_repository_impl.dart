import 'package:activity_suggestor/activity_feature/data/datasources/activity_remote_source.dart';
import 'package:activity_suggestor/activity_feature/domain/entities/activity_entity.dart';
import 'package:activity_suggestor/activity_feature/domain/repository/activity_suggestor_repository.dart';
import 'package:activity_suggestor/core/error/exceptions.dart';
import 'package:activity_suggestor/core/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:activity_suggestor/core/error/failures.dart';

class ActivitySuggestorRepositoryImpl implements ActivitySuggestorRepository {
  final ActivityRemoteSource activityRemoteSource;
  final NetWorkInfo networkInfo;

  ActivitySuggestorRepositoryImpl(
      {required this.activityRemoteSource, required this.networkInfo});
  @override
  Future<Either<Failure, ActivityEntity>> getActivity() async {
    return await _getActivity();
  }

  Future<Either<Failure, ActivityEntity>> _getActivity() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteActivity =
            await activityRemoteSource.getActivitySuggestion();

        return Right(remoteActivity);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
