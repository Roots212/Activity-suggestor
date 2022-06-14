import 'package:activity_suggestor/activity_feature/domain/entities/activity_entity.dart';
import 'package:activity_suggestor/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ActivitySuggestorRepository {
  Future<Either<Failure, ActivityEntity>> getActivity();
}
