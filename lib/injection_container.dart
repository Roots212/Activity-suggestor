import 'package:activity_suggestor/activity_feature/data/datasources/activity_remote_source.dart';
import 'package:activity_suggestor/activity_feature/data/repository/activity_suggestor_repository_impl.dart';
import 'package:activity_suggestor/activity_feature/domain/repository/activity_suggestor_repository.dart';
import 'package:activity_suggestor/activity_feature/domain/usecases/getActivity_suggestion.dart';
import 'package:activity_suggestor/activity_feature/presentation/bloc/activity_bloc.dart';
import 'package:activity_suggestor/core/network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shake/shake.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //bloc
  sl.registerFactory(() => ActivityBloc(getActivitySuggestion: sl()));
  //usecase
  sl.registerLazySingleton(() => GetActivitySuggestion(sl()));
  //Repository
  sl.registerLazySingleton<ActivitySuggestorRepository>(() =>
      ActivitySuggestorRepositoryImpl(
          activityRemoteSource: sl(), networkInfo: sl()));

  //datasources
  sl.registerLazySingleton<ActivityRemoteSource>(
      () => ActivityRemoteSourceImpl());
//core
  sl.registerLazySingleton<NetWorkInfo>(() => NetworkInfoImpl(sl()));

  //external
  sl.registerLazySingleton(() => InternetConnectionChecker());


}
