import 'dart:async';
import 'package:bloc/bloc.dart';
import './photos.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  @override
  PhotosState get initialState => PhotosState();

  @override
  Stream<PhotosState> mapEventToState(
    PhotosEvent event,
  ) async* {
    if (event is InitPhotos) {
      yield currentState.copyWith(photos: event.photos);
    }
  }
}
