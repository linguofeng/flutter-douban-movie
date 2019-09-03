import 'package:douban_movie/blocs/blocs.dart';
import 'package:douban_movie/models/subject.dart';
import 'package:douban_movie/pages/more.page.dart';
import 'package:douban_movie/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Section extends StatelessWidget {
  final String title;
  final List<Subject> items;

  const Section({Key key, this.title, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<HomeBloc>(context),
                      child: MorePage(title: title),
                    ),
                  ));
                },
                child: Text(
                  '查看更多 >',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Item(subject: items[index]);
            },
          ),
        ),
      ],
    );
  }
}
