import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:marvel_api/data/datasource/remote_datasource.dart';
import 'package:marvel_api/data/repositories/mavel_repository_impl.dart';
import 'package:marvel_api/domain/repositories/marvel_repository.dart';
import 'package:marvel_api/domain/use_cases/get_marvel_api.dart';
import 'package:marvel_api/ui/pages/characters/bloc/characters_bloc.dart';
import 'package:marvel_api/ui/pages/comics/bloc/comics_bloc.dart';
import 'package:marvel_api/ui/pages/home/bloc/home_bloc.dart';


final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => HomeBloc(locator()));
  locator.registerFactory(() => CharactersBloc(locator()));
  locator.registerFactory(() => ComicsBloc(locator()));
 
  // cubit
  // locator.registerFactory(() => MoviesGenresBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetMarvelApi(locator()));

  // repository
  locator.registerLazySingleton<MarvelRepository>(
    () => MarvelRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );


  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource(
        baseUrl: "",
        connectTimeout: 1,
        receiveTimeOut: 5)
  );



  // external
  locator.registerLazySingleton(() => http.Client());
}
