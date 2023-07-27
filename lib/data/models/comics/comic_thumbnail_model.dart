import 'package:marvel_bia_app_flutter/core/constants/app_constants.dart';
import 'package:marvel_bia_app_flutter/data/dtos/comics/comic_thumbnail_dto.dart';

class ComicThumbnailModel {
  final String path;
  final String extension;

  ComicThumbnailModel({
    required this.path,
    required this.extension
  });

  static ComicThumbnailModel fromDTO({ComicThumbnailDTO? dto}) {
    return ComicThumbnailModel(
        path: dto?.path ?? kDefaultEmptyString,
        extension: dto?.extension ?? kDefaultEmptyString
    );
  }
}