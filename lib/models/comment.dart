import 'package:douban_movie/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  final String id;
  final String comment;
  @JsonKey(name: 'create_time')
  final DateTime createdAt;
  final User user;

  Comment({this.id, this.comment, this.createdAt, this.user});
  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
