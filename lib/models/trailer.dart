import 'package:json_annotation/json_annotation.dart';

part 'trailer.g.dart';

@JsonSerializable()
class Trailer {
  @JsonKey(name: 'cover_url')
  final String coverUrl;

  @JsonKey(name: 'video_url')
  final String videoUrl;

  final String runtime;

  Trailer({this.coverUrl, this.videoUrl, this.runtime});

  factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);
  Map<String, dynamic> toJson() => _$TrailerToJson(this);
}
