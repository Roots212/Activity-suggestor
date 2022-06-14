import 'package:activity_suggestor/activity_feature/domain/entities/activity_entity.dart';
import 'package:activity_suggestor/activity_feature/domain/repository/activity_suggestor_repository.dart';
import 'package:activity_suggestor/core/error/failures.dart';
import 'package:activity_suggestor/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetActivitySuggestion implements Usecase<ActivityEntity, NoParams> {
  final ActivitySuggestorRepository activitySuggestorRepository;

  GetActivitySuggestion(this.activitySuggestorRepository);
  @override
  Future<Either<Failure, ActivityEntity>> call(params) async {
    return await activitySuggestorRepository.getActivity();
  }
}
