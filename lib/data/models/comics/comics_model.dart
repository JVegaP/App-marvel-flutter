import 'package:marvel_bia_app_flutter/core/constants/app_constants.dart';
import 'package:marvel_bia_app_flutter/data/dtos/comics/comics_dto.dart';
import 'package:marvel_bia_app_flutter/data/models/comics/comic_thumbnail_model.dart';

class ComicsModel {
  final int id;
  final String title;
  final String description;
  final String isbn;
  final ComicThumbnailModel? thumbnail;

  ComicsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isbn,
    this.thumbnail
  });

  static ComicsModel fromDTO({ComicsDTO? dto}) {
    return ComicsModel(
        id: dto?.id ?? kDefaultValueInt,
        title: dto?.title ?? kDefaultEmptyString,
        description: dto?.description ?? kDefaultEmptyString,
        isbn: dto?.isbn ?? kDefaultEmptyString,
        thumbnail: ComicThumbnailModel.fromDTO(dto: dto?.thumbnail)
    );
  }
}