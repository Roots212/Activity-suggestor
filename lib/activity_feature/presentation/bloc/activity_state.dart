part of 'activity_bloc.dart';

@immutable
abstract class ActivityState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends ActivityState {}

class Fetching extends ActivityState {}

class Fetched extends ActivityState {
  final ActivityEntity activityEntity;

  Fetched({required this.activityEntity});

  @override
   List<Object> get props => [activityEntity];
}

class FetchError extends ActivityState {}
