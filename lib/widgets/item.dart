import 'package:douban_movie/models/subject.dart';
import 'package:douban_movie/widgets/rate.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final Subject subject;

  const Item({Key key, this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: subject.type == 'music'
              ? SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    subject.cover.url,
                    scale: 0.5,
                    fit: BoxFit.fitWidth,
                  ),
                )
              : SizedBox(
                  width: 100,
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Image.network(
                      subject.cover.url,
                      scale: 0.5,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            subject.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        subject.rating != null
            ? Rate(value: subject.rating.value)
            : Text(
                '暂无评分',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11.0,
                ),
              ),
      ],
    );
  }
}
