import 'package:douban_movie/models/comment.dart';
import 'package:douban_movie/models/cover.dart';
import 'package:douban_movie/models/rating.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject {
  final String id;
  final String title;
  final String type;
  final Cover cover;
  final Rating rating;
  final List<Comment> comments;

  Subject({
    this.id,
    this.title,
    this.type,
    this.cover,
    this.rating,
    this.comments,
  });
  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}
