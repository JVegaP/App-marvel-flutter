import 'package:marvel_bia_app_flutter/core/constants/api_constants.dart';
import 'package:marvel_bia_app_flutter/core/managers/call_network_manager.dart';
import 'package:marvel_bia_app_flutter/data/dtos/base/base_response_dto.dart';

class MarvelApi {
  Map<String, String> headers = <String, String>{
    kContentType: kApplicationJson
  };

  /// -------------------- PUBLIC METHODS --------------------

  /// Method that obtain list of comics
  /// param : [url] value string of service url
  Future<BaseResponseDTO?> getComics({required String url}) async {
    final Map<dynamic, dynamic>? response = await callGet(url: url, headers: headers);
    final BaseResponseDTO? result = BaseResponseDTO.fromJson(response);
    return result;
  }

  /// Method that obtain detail comic by id
  /// param : [url] value string of service url
  Future<BaseResponseDTO?> getComicById({required String url}) async {
    final Map<dynamic, dynamic>? response = await callGet(url: url, headers: headers);
    final BaseResponseDTO? result = BaseResponseDTO.fromJson(response);
    return result;
  }

}