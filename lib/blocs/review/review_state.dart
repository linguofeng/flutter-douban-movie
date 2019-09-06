import 'package:douban_movie/models/review.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ReviewState extends Equatable {
  ReviewState([List props = const <dynamic>[]]) : super(props);
}

class InitialReviewState extends ReviewState {}

class ReviewLoaded extends ReviewState {
  final Review review;

  ReviewLoaded(this.review) : super([review]);
}
