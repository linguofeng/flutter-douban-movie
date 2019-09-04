import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:douban_movie/models/subject.dart';
import 'package:http/http.dart' as http;
import './home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadShowing) {
      {
        final json = await http
            .get(
                'http://localhost:8081/api/v2/subject_collection/movie_showing/items?start=0&count=20&apiKey=054022eaeae0b00e0fc068c0c0a2102a')
            .then((response) => response.body)
            .then((data) => jsonDecode(data));
        final items = json['subject_collection_items'] as List<dynamic>;
        final list = items.map((item) => Subject.fromJson(item)).toList();
        yield currentState.copyWith(showing: list);
      }
      {
        final json = await http
            .get(
                'http://localhost:8081/api/v2/subject_collection/movie_hot_gaia/items?start=0&count=20&apiKey=054022eaeae0b00e0fc068c0c0a2102a')
            .then((response) => response.body)
            .then((data) => jsonDecode(data));
        final items = json['subject_collection_items'] as List<dynamic>;
        final list = items.map((item) => Subject.fromJson(item)).toList();
        yield currentState.copyWith(hot: list);
      }
      {
        final json = await http
            .get(
                'http://localhost:8081/api/v2/subject_collection/tv_hot/items?start=0&count=20&apiKey=054022eaeae0b00e0fc068c0c0a2102a')
            .then((response) => response.body)
            .then((data) => jsonDecode(data));
        final items = json['subject_collection_items'] as List<dynamic>;
        final list = items.map((item) => Subject.fromJson(item)).toList();
        yield currentState.copyWith(tvHot: list);
      }
      {
        final json = await http
            .get(
                'http://localhost:8081/api/v2/subject_collection/tv_variety_show/items?start=0&count=20&apiKey=054022eaeae0b00e0fc068c0c0a2102a')
            .then((response) => response.body)
            .then((data) => jsonDecode(data));
        final items = json['subject_collection_items'] as List<dynamic>;
        final list = items.map((item) => Subject.fromJson(item)).toList();
        yield currentState.copyWith(tvShow: list);
      }
      {
        final json = await http
            .get(
                'http://localhost:8081/api/v2/subject_collection/book_bestseller/items?start=0&count=20&apiKey=054022eaeae0b00e0fc068c0c0a2102a')
            .then((response) => response.body)
            .then((data) => jsonDecode(data));
        final items = json['subject_collection_items'] as List<dynamic>;
        final list = items.map((item) => Subject.fromJson(item)).toList();
        yield currentState.copyWith(books: list);
      }
      {
        final json = await http
            .get(
                'http://localhost:8081/api/v2/subject_collection/music_single/items?start=0&count=20&apiKey=054022eaeae0b00e0fc068c0c0a2102a')
            .then((response) => response.body)
            .then((data) => jsonDecode(data));
        final items = json['subject_collection_items'] as List<dynamic>;
        final list = items.map((item) => Subject.fromJson(item)).toList();
        yield currentState.copyWith(music: list);
      }
    }
  }
}
