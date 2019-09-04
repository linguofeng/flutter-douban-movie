import 'package:douban_movie/models/photo.dart';
import 'package:douban_movie/models/subject_detail.dart';
import 'package:douban_movie/models/trailer.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DetailState extends Equatable {
  DetailState([List props = const <dynamic>[]]) : super(props);
}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {
  final SubjectDetail detail;
  final List<Trailer> trailers;
  final List<Photo> photos;
  final int photoTotal;

  DetailLoaded(
    this.detail, {
    this.trailers = const [],
    this.photos = const [],
    this.photoTotal = 0,
  }) : super([detail, trailers, photos, photoTotal]);

  DetailLoaded copyWith({
    SubjectDetail detail,
    List<Trailer> trailers,
    List<Photo> photos,
    int photoTotal,
  }) {
    return DetailLoaded(
      detail ?? this.detail,
      trailers: trailers ?? this.trailers,
      photos: photos ?? this.photos,
      photoTotal: photoTotal ?? this.photoTotal,
    );
  }
}
