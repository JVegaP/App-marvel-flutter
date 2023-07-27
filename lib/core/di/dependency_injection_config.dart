import 'package:get_it/get_it.dart';
import 'package:marvel_bia_app_flutter/data/api/marvel_api.dart';
import 'package:marvel_bia_app_flutter/data/datasource/remote/comics_remote_data_source.dart';
import 'package:marvel_bia_app_flutter/data/repositories/comics_repository_imp.dart';
import 'package:marvel_bia_app_flutter/domain/repositories/comics_repository.dart';
import 'package:marvel_bia_app_flutter/domain/use_cases/get_all_comics_use_case.dart';
import 'package:marvel_bia_app_flutter/domain/use_cases/get_comic_by_id_use_case.dart';
import 'package:marvel_bia_app_flutter/presentation/detail/provider/detail_comic_provider.dart';
import 'package:marvel_bia_app_flutter/presentation/home/provider/home_provider.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  /// Api
  getIt.registerLazySingleton<ComicsRemoteDataSource>(() => IComicsRemoteDataSource());
  /// DataSources
  getIt.registerLazySingleton<MarvelApi>(() => MarvelApi());
  /// Repositories
  getIt.registerLazySingleton<ComicsRepository>(() => IComicsRepository());
  /// Use cases
  getIt.registerLazySingleton<GetAllComicsUseCase>(() => GetAllComicsUseCase());
  getIt.registerLazySingleton<GetComicByIdUseCase>(() => GetComicByIdUseCase());
  /// Providers
  getIt.registerFactory<HomeProvider>(() => HomeProvider());
  getIt.registerFactory<DetailComicProvider>(() => DetailComicProvider());
}