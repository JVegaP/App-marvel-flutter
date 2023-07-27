import 'package:marvel_bia_app_flutter/core/constants/api_constants.dart';
import 'package:marvel_bia_app_flutter/core/di/dependency_injection_config.dart';
import 'package:marvel_bia_app_flutter/data/datasource/remote/comics_remote_data_source.dart';
import 'package:marvel_bia_app_flutter/data/models/base/base_error_model.dart';
import 'package:marvel_bia_app_flutter/data/models/base/base_response_model.dart';
import 'package:marvel_bia_app_flutter/data/models/base/base_result_model.dart';
import 'package:marvel_bia_app_flutter/domain/repositories/comics_repository.dart';

class IComicsRepository extends ComicsRepository {

  final ComicsRemoteDataSource _comicsRemoteDataSource;

  IComicsRepository({
    ComicsRemoteDataSource? comicsRemoteDataSource
  }): _comicsRemoteDataSource = comicsRemoteDataSource ?? getIt<ComicsRemoteDataSource>();

  ///--------------------------------- PUBLIC METHODS ---------------------------------

  @override
  Future<Result<dynamic>> getAllComics({String? title}) async {
    final BaseResponseModel? response = await _comicsRemoteDataSource.getListComics(title: title);
    if(response != null) {
      switch (response.statusCode) {
        case kApiCodeSuccess:
          return Success(data: response.data);
        default:
          return Failure<dynamic>(
              error: BaseErrorModel(
                  message: response.message
              )
          );
      }
    } else {
      return Failure<dynamic>(
        error: BaseErrorModel(
          message: response?.message
        )
      );
    }
  }

  @override
  Future<Result> getComic({required int id}) async {
    final BaseResponseModel? response = await _comicsRemoteDataSource.getComic(id: id);
    if(response != null) {
      switch (response.statusCode) {
        case kApiCodeSuccess:
          return Success(data: response.data);
        default:
          return Failure<dynamic>(
              error: BaseErrorModel(
                  message: response.message
              )
          );
      }
    } else {
      return Failure<dynamic>(
          error: BaseErrorModel(
              message: response?.message
          )
      );
    }
  }

}