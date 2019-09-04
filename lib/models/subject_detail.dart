import 'package:douban_movie/models/actor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_detail.g.dart';

@JsonSerializable()
class SubjectDetail {
  final String id;

  /// 标题
  final String title;

  /// 原标题
  @JsonKey(name: 'original_title')
  final String originalTitle;

  @JsonKey(name: 'pic', fromJson: _picNormal)
  final String image;

  /// 年份
  final String year;

  /// 类型
  final List<String> genres;

  /// 国家
  final List<String> countries;

  /// 片长
  final List<String> durations;

  /// 简介
  final String intro;

  /// 影人
  final List<Actor> actors;

  SubjectDetail({
    this.id,
    this.title,
    this.originalTitle,
    this.year,
    this.image,
    this.genres,
    this.countries,
    this.durations,
    this.intro,
    this.actors,
  });

  factory SubjectDetail.fromJson(Map<String, dynamic> json) =>
      _$SubjectDetailFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectDetailToJson(this);

  static String _picNormal(Map<String, dynamic> json) => json['normal'];
}
