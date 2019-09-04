import 'package:json_annotation/json_annotation.dart';

part 'actor.g.dart';

@JsonSerializable()
class Actor {
  final String name;
  @JsonKey(name: 'cover_url')
  final String avatar;
  final List<String> roles;

  Actor({this.name, this.avatar, this.roles});

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);
  Map<String, dynamic> toJson() => _$ActorToJson(this);
}
