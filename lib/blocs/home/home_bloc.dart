import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:douban_movie/models/subject.dart';
import './home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is LoadShowing) {
      final json = await HttpClient()
          .getUrl(Uri.parse(
              'https://frodo.douban.com/api/v2/subject_collection/movie_showing/items?start=0&count=20&apiKey=054022eaeae0b00e0fc068c0c0a2102a'))
          .then((request) => request.close())
          .then((response) => response.transform(Utf8Decoder()).join())
          .then((data) => jsonDecode(data));
      final items = json['subject_collection_items'] as List<dynamic>;
      final list = items.map((item) => Subject.fromJson(item)).toList();
      print(list);
      yield HomeState(showing: list);
    }
  }
}