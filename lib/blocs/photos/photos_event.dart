import 'package:douban_movie/models/photo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PhotosEvent extends Equatable {
  PhotosEvent([List props = const <dynamic>[]]) : super(props);
}

class InitPhotos extends PhotosEvent {
  final List<Photo> photos;

  InitPhotos(this.photos) : super([photos]);
}
