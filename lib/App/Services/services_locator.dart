import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Modules/Quran/index.dart';
import 'network_services.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Modules - posts

// Bloc
  sl.registerFactory(() => IndexBloc(getIndexUseCase: sl()));

// Usecases
  sl.registerLazySingleton(() => GetIndexUseCase(sl()));

// Repository
  sl.registerLazySingleton<BaseQuranRepository>(
    () => QuranRepositoryImp(
      remoteQuranDataSource: sl(),
      localQuranDataSource: sl(),
      networkService: sl(),
    ),
  );

// Datasources
  sl.registerLazySingleton<BaseQuranRemoteDataSource>(
    () => QuranRemoteDataSource(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<QuranLocalDataSource>(
    () => QuranLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );

  //
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
