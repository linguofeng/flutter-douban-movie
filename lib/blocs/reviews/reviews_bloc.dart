import 'dart:async';
import 'dart:convert';
import 'package:douban_movie/models/review.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import './reviews.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  @override
  ReviewsState get initialState => InitialReviewsState();

  @override
  Stream<ReviewsState> mapEventToState(
    ReviewsEvent event,
  ) async* {
    if (event is LoadReviews) {
      final json = await http
          .get(
            'https://frodo.douban.com/api/v2/${event.type}/${event.id}/reviews?apiKey=054022eaeae0b00e0fc068c0c0a2102a',
          )
          .then((response) => response.body)
          .then((data) => jsonDecode(data));
      yield ReviewsLoaded(
        total: json['total'],
        reviews: (json['reviews'] as List<dynamic>)
            .map(
              (item) => Review.fromJson(item),
            )
            .toList(),
      );
    }
  }
}
