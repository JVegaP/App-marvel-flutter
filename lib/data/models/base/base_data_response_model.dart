import 'package:marvel_bia_app_flutter/core/constants/app_constants.dart';
import 'package:marvel_bia_app_flutter/data/dtos/base/base_data_response_dto.dart';
import 'package:marvel_bia_app_flutter/data/models/comics/comics_model.dart';

class BaseDataResponseModel {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<ComicsModel> results;

  BaseDataResponseModel({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results
  });

  static BaseDataResponseModel fromDTO({required BaseDataResponseDTO dto}) {
    return BaseDataResponseModel(
        offset: dto.offset ?? kDefaultValueInt,
        limit: dto.limit ?? kDefaultValueInt,
        total: dto.total ?? kDefaultValueInt,
        count: dto.count ?? kDefaultValueInt,
        results: List<ComicsModel>.from(dto.results!.map((element) => ComicsModel.fromDTO(dto: element))).toList()
    );
  }
}