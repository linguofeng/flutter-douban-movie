import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {
  final Image image;

  Photo({this.image});

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

@JsonSerializable()
class Image {
  @JsonKey(fromJson: _url)
  final String small;
  @JsonKey(fromJson: _url)
  final String large;
  @JsonKey(fromJson: _url)
  final String normal;

  Image({this.small, this.large, this.normal});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
  Map<String, dynamic> toJson() => _$ImageToJson(this);

  static String _url(json) => json['url'];
}
