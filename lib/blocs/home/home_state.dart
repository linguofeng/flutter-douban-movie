import 'package:douban_movie/models/subject.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class HomeState extends Equatable {
  final List<Subject> showing;
  final List<Subject> hot;
  final List<Subject> tvHot;
  final List<Subject> tvShow;
  final List<Subject> books;
  final List<Subject> music;

  HomeState({
    this.showing = const [],
    this.hot = const [],
    this.tvHot = const [],
    this.tvShow = const [],
    this.books = const [],
    this.music = const [],
  }) : super([showing, hot, tvHot, tvShow, books, music]);

  copyWith({
    List<Subject> showing,
    List<Subject> hot,
    List<Subject> tvHot,
    List<Subject> tvShow,
    List<Subject> books,
    List<Subject> music,
  }) {
    return HomeState(
      showing: showing ?? this.showing,
      hot: hot ?? this.hot,
      tvHot: tvHot ?? this.tvHot,
      tvShow: tvShow ?? this.tvShow,
      books: books ?? this.books,
      music: music ?? this.music,
    );
  }
}
