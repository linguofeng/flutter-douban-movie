import 'package:douban_movie/models/review.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ReviewsState extends Equatable {
  ReviewsState([List props = const <dynamic>[]]) : super(props);
}

class InitialReviewsState extends ReviewsState {}

class ReviewsLoaded extends ReviewsState {
  final List<Review> reviews;
  final int total;

  ReviewsLoaded({
    this.reviews = const [],
    this.total = 0,
  }) : super([reviews, total]);
}
