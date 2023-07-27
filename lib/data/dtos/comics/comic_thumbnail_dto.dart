class ComicThumbnailDTO {
  String? path;
  String? extension;

  ComicThumbnailDTO({
    this.path,
    this.extension
  });

  static ComicThumbnailDTO? fromJson(Map<dynamic, dynamic>? json) {
    if(json == null) return null;
    return ComicThumbnailDTO(
        path:  json['path'] == null ? null : json['path'] as String,
        extension: json['extension'] == null ? null : json['extension'] as String
    );
  }
}