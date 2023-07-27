import 'package:marvel_bia_app_flutter/core/di/dependency_injection_config.dart';
import 'package:marvel_bia_app_flutter/data/models/base/base_result_model.dart';
import 'package:marvel_bia_app_flutter/domain/repositories/comics_repository.dart';

/// Use case that consults the information of all the comics
class GetAllComicsUseCase {
  final ComicsRepository _comicsRepository;

  GetAllComicsUseCase({
    ComicsRepository? comicsRepository
  }): _comicsRepository = comicsRepository ?? getIt<ComicsRepository>();

  /// Method that return all comics or any exception
  /// return : Object of type [Result] with list of data or exception
  Future<Result<dynamic>> invoke({String? title}) async {
    final Result<dynamic> result = await _comicsRepository.getAllComics(title: title);
    return result;
  }
}