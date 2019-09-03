import 'package:douban_movie/blocs/blocs.dart';
import 'package:douban_movie/widgets/section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) => SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Section(
                title: '影院热映',
                items: state.showing,
              ),
              Section(
                title: '豆瓣热门',
                items: state.showing,
              ),
              Section(
                title: '近期热门剧集',
                items: state.showing,
              ),
              Section(
                title: '近期热门综艺',
                items: state.showing,
              ),
              Section(
                title: '畅销图书',
                items: state.showing,
              ),
              Section(
                title: '热门单曲榜',
                items: state.showing,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
