
import 'package:activity_suggestor/activity_feature/domain/entities/activity_entity.dart';
import 'package:activity_suggestor/activity_feature/domain/usecases/getActivity_suggestion.dart';
import 'package:activity_suggestor/core/error/failures.dart';
import 'package:activity_suggestor/core/usecases/usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final GetActivitySuggestion getActivitySuggestion;
  ActivityBloc({required this.getActivitySuggestion}) : super(Empty()) {
    on<GetActivity>(_mapEventToState);
  }

  _mapEventToState(GetActivity event, Emitter<ActivityState> emit) async {
    emit(Fetching());
    final failureOrActivity = await getActivitySuggestion(NoParams());
    emit(_eitherLoadedOrErrorState(failureOrActivity));
  }
}

ActivityState _eitherLoadedOrErrorState(Either<Failure, ActivityEntity> failureOrActivity) {
  return failureOrActivity.fold((failure) => FetchError(), (activity) => Fetched(activityEntity: activity));
}
