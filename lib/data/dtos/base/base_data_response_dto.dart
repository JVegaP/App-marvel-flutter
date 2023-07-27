import 'package:marvel_bia_app_flutter/data/dtos/comics/comics_dto.dart';

class BaseDataResponseDTO {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<ComicsDTO?>? results;

  BaseDataResponseDTO({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results
  });

  static BaseDataResponseDTO? fromJson(Map<dynamic, dynamic>? json) {
    if(json == null) return null;
    return BaseDataResponseDTO(
        offset:  json['offset'] == null ? null : json['offset'] as int,
        limit:  json['limit'] == null ? null : json['limit'] as int,
        total:  json['total'] == null ? null : json['total'] as int,
        count:  json['count'] == null ? null : json['count'] as int,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => ComicsDTO.fromJson(e as Map<String, dynamic>))
            .toList(),
    );
  }

  Map<String, dynamic> toJson() => _$BaseDataResponseDTOToJson(this);

  Map<String, dynamic> _$BaseDataResponseDTOToJson(BaseDataResponseDTO instance) =>
      <String, dynamic>{
        'offset': instance.offset,
        'limit': instance.limit,
        'total': instance.total,
        'count': instance.count,
        'results': instance.results
  };
}