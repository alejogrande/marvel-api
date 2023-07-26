import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:marvel_api/data/datasource/remote_datasource.dart';
import 'package:marvel_api/data/model/app_config_model.dart';
import 'package:marvel_api/data/repositories/mavel_repository_impl.dart';
import 'package:marvel_api/domain/entities/app_config_entity.dart';
import 'package:marvel_api/domain/repositories/marvel_repository.dart';
import 'package:marvel_api/domain/use_cases/get_marvel_api.dart';
import 'package:marvel_api/ui/pages/characters/bloc/characters_bloc.dart';
import 'package:marvel_api/ui/pages/comics/bloc/comics_bloc.dart';
import 'package:marvel_api/ui/pages/home/bloc/home_bloc.dart';
import 'package:yaml/yaml.dart';

final locator = GetIt.instance;

Future<void> init() async {
  final configFile = await rootBundle.loadString('assets/app_config.yaml');
  final YamlMap yamlMap = loadYaml(configFile);
  late AppConfig appConfig = AppConfigModel.fromMap(yamlMap);
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
        baseUrl: appConfig.baseUrl,
        connectTimeout: appConfig.connectTimeOut,
        receiveTimeOut: appConfig.receiveTimeOut,
        hash: appConfig.hash,
        ts: appConfig.ts,
      ));

  // external
  locator.registerLazySingleton(() => http.Client());
}
