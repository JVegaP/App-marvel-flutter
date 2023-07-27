import 'package:marvel_bia_app_flutter/core/constants/api_constants.dart';
import 'package:marvel_bia_app_flutter/data/api/marvel_api.dart';
import 'package:marvel_bia_app_flutter/data/dtos/base/base_response_dto.dart';
import 'package:marvel_bia_app_flutter/data/models/base/base_response_model.dart';

abstract class ComicsRemoteDataSource {
  /// Method that obtain list of comics
  /// return : Future of type [BaseResponseModel] with response of service
  Future<BaseResponseModel?> getListComics({String? title});

  /// Method that obtain comic detail
  /// param : [id] value int of id comic
  /// return : Future of type [BaseResponseModel] with response of service
  Future<BaseResponseModel?> getComic({required int id});
}

class IComicsRemoteDataSource extends ComicsRemoteDataSource {
  final MarvelApi _marvelApi;

  IComicsRemoteDataSource({
    MarvelApi? marvelApi
  }): _marvelApi = marvelApi ?? MarvelApi();

  /// -------------------- PUBLIC METHODS --------------------

  @override
  Future<BaseResponseModel?> getListComics({String? title}) async {
    final BaseResponseDTO? response = await _marvelApi.getComics(url: _getUrlComics(title: title));
    if(response!=null) {
      return BaseResponseModel.fromDTO(dto: response);
    }
    return null;
  }

  @override
  Future<BaseResponseModel?> getComic({required int id}) async {
    final BaseResponseDTO? response = await _marvelApi.getComicById(url: '$kUrlBase/$id$kUrlBaseAuthorization');
    if(response!=null) {
      return BaseResponseModel.fromDTO(dto: response);
    }
    return null;
  }

  /// -------------------- PRIVATE METHODS --------------------

  /// Method that builds the url based on the parameter received
  /// param : Value String [title] with name search
  /// return : Value String with url completed
  String _getUrlComics({String? title}) {
    var urlBase = '$kUrlBase$kUrlBaseAuthorization';
    if(title!=null) {
      urlBase = '$urlBase$kUrlFilterTitle$title';
    }
    return urlBase;
  }
}