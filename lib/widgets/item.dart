import 'package:douban_movie/models/subject.dart';
import 'package:douban_movie/widgets/rate.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final Subject subject;

  const Item({Key key, this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 60,
          height: 100,
          child: Image.network(subject.cover.url),
        ),
        Text(subject.title),
        subject.rating != null
            ? Rate(value: subject.rating.value)
            : Text('暂无评分'),
      ],
    );
  }
}
