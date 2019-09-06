import 'dart:async';
import 'dart:convert';
import 'package:douban_movie/models/review.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import './review.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  @override
  ReviewState get initialState => InitialReviewState();

  @override
  Stream<ReviewState> mapEventToState(
    ReviewEvent event,
  ) async* {
    if (event is LoadReview) {
      final json = await http
          .get(
            'https://frodo.douban.com/api/v2/review/${event.id}?apiKey=054022eaeae0b00e0fc068c0c0a2102a',
          )
          .then((response) => response.body)
          .then((data) => jsonDecode(data));
      yield ReviewLoaded(Review.fromJson(json));
    }
  }
}
