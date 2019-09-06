import 'package:douban_movie/models/rating.dart';
import 'package:douban_movie/models/subject.dart';
import 'package:douban_movie/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  final String id;
  final String title;
  final String type;
  @JsonKey(name: 'abstract')
  final String content;
  final Rating rating;
  final User user;
  @JsonKey(name: 'comments_count')
  final int commentsCount;
  @JsonKey(name: 'likers_count')
  final int likersCount;
  @JsonKey(name: 'timeline_share_count')
  final int shareCount;
  @JsonKey(name: 'content')
  final String html;
  final Subject subject;
  @JsonKey(name: 'create_time')
  final String createdAt;

  Review({
    this.id,
    this.title,
    this.type,
    this.content,
    this.rating,
    this.user,
    this.commentsCount,
    this.likersCount,
    this.shareCount,
    this.html,
    this.subject,
    this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
