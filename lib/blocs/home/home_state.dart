import 'package:douban_movie/models/subject.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class HomeState extends Equatable {
  final List<Subject> showing;

  HomeState({this.showing = const []}) : super([showing]);
}
