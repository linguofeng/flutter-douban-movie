import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ReviewsEvent extends Equatable {
  ReviewsEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadReviews extends ReviewsEvent {
  final String type;
  final String id;

  LoadReviews({@required this.type, @required this.id}) : super([type, id]);
}
