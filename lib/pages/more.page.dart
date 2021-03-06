import 'package:douban_movie/blocs/blocs.dart';
import 'package:douban_movie/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MorePage extends StatelessWidget {
  final String title;

  const MorePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.6,
          ),
          itemCount: state.showing.length,
          itemBuilder: (context, index) => Item(
            subject: state.showing[index],
          ),
        ),
      ),
    );
  }
}
