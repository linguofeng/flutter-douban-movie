import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DetailEvent extends Equatable {
  DetailEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadDetail extends DetailEvent {
  final String id;
  final String type;

  LoadDetail({@required this.id, @required this.type}) : super([id, type]);
}
