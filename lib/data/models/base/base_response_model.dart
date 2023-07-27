import 'package:marvel_bia_app_flutter/data/dtos/base/base_response_dto.dart';
import 'package:marvel_bia_app_flutter/data/models/base/base_data_response_model.dart';

class BaseResponseModel {
  dynamic statusCode;
  dynamic data;
  String? message;

  BaseResponseModel({
    this.statusCode,
    this.data,
    this.message
  });

  static BaseResponseModel fromDTO({required BaseResponseDTO dto}) {
    return BaseResponseModel(
        statusCode: dto.statusCode,
        data: BaseDataResponseModel.fromDTO(dto: dto.data),
        message: dto.message
    );
  }
}