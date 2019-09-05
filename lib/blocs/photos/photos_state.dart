import 'package:douban_movie/models/photo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class PhotosState extends Equatable {
  final List<Photo> photos;

  PhotosState({this.photos = const []}) : super([photos]);

  copyWith({List<Photo> photos}) {
    return PhotosState(photos: photos ?? this.photos);
  }
}
