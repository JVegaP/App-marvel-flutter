import 'package:marvel_bia_app_flutter/core/di/dependency_injection_config.dart';
import 'package:marvel_bia_app_flutter/data/models/base/base_result_model.dart';
import 'package:marvel_bia_app_flutter/domain/repositories/comics_repository.dart';

/// Use case that consults the information of detail comic
class GetComicByIdUseCase {
  final ComicsRepository
  _comicsRepository;

  GetComicByIdUseCase({
    ComicsRepository? comicsRepository
  }): _comicsRepository = comicsRepository ?? getIt<ComicsRepository>();

  /// Method that return all comics or any exception
  /// param : [id] value int of id comic
  /// return : Object of type [Result] with object or exception
  Future<Result<dynamic>> invoke({required int id}) async {
    final Result<dynamic> result = await _comicsRepository.getComic(id: id);
    return result;
  }
}