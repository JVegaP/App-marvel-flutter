import 'package:marvel_bia_app_flutter/data/dtos/base/base_data_response_dto.dart';

class BaseResponseDTO {
  dynamic data;
  dynamic statusCode;
  String? message;

  BaseResponseDTO({
    this.data,
    this.statusCode,
    this.message
  });

  Map<String, dynamic> toJson() => _$BaseResponseDTOToJson(this);

  static BaseResponseDTO? fromJson(Map<dynamic, dynamic>? json) {
    if(json == null) return null;
    if(json['statusCode'] == null &&
        json['data'] == null &&
        json['message'] == null
    ) return null;
    return BaseResponseDTO(
      statusCode:  json['code'] == null ? null : json['code'] as dynamic,
      data: json['data'] == null ? null : json['data'] is Map<String, dynamic> ? BaseDataResponseDTO.fromJson(json['data']) : null,
      message: json['message'] == null ? null : json['message'] as String
    );
  }

  Map<String, dynamic> _$BaseResponseDTOToJson(BaseResponseDTO instance) =>
      <String, dynamic>{
        'data': instance.data,
        'statusCode': instance.statusCode,
        'message': instance.message
  };
}