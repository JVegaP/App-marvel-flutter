import 'package:marvel_bia_app_flutter/data/models/base/base_result_model.dart';

abstract class ComicsRepository {
  /// Method that obtain all the comics
  /// return : Object of type [Result]
  Future<Result<dynamic>> getAllComics({String? title});

  /// Method that obtain detail of comic.
  /// param : [id] of comic selected
  Future<Result<dynamic>> getComic({required int id});
}