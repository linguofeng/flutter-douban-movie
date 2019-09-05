import 'dart:async';
import 'dart:convert';
import 'package:douban_movie/blocs/blocs.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:douban_movie/models/photo.dart';
import 'package:douban_movie/models/subject_detail.dart';
import 'package:douban_movie/models/trailer.dart';
import './detail.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final reviewsBloc = ReviewsBloc();

  @override
  DetailState get initialState => DetailLoading();

  @override
  Stream<DetailState> mapEventToState(
    DetailEvent event,
  ) async* {
    if (event is LoadDetail) {
      {
        final json = await http
            .get(
              'https://frodo.douban.com/api/v2/${event.type}/${event.id}?apiKey=054022eaeae0b00e0fc068c0c0a2102a',
            )
            .then((response) => response.body)
            .then((data) => jsonDecode(data));
        yield DetailLoaded(SubjectDetail.fromJson(json));
      }
      {
        final json = await http
            .get(
              'https://frodo.douban.com/api/v2/${event.type}/${event.id}/trailers?apiKey=054022eaeae0b00e0fc068c0c0a2102a',
            )
            .then((response) => response.body)
            .then((data) => jsonDecode(data));
        final state = currentState;
        if (state is DetailLoaded) {
          yield state.copyWith(
            trailers: (json['trailers'] as List<dynamic>)
                .map(
                  (item) => Trailer.fromJson(item),
                )
                .toList(),
          );
        }
      }
      {
        final json = await http
            .get(
              'https://frodo.douban.com/api/v2/${event.type}/${event.id}/photos?apiKey=054022eaeae0b00e0fc068c0c0a2102a',
            )
            .then((response) => response.body)
            .then((data) => jsonDecode(data));
        final state = currentState;
        if (state is DetailLoaded) {
          yield state.copyWith(
            photoTotal: json['total'],
            photos: (json['photos'] as List<dynamic>)
                .map(
                  (item) => Photo.fromJson(item),
                )
                .toList(),
          );
        }
      }

      reviewsBloc.dispatch(LoadReviews(id: event.id, type: event.type));
    }
  }
}
