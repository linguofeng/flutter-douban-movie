import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ReviewEvent extends Equatable {
  ReviewEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadReview extends ReviewEvent {
  final String id;

  LoadReview({@required this.id}) : super([id]);
}