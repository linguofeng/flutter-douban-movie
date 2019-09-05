import 'package:douban_movie/pages/main.page.dart';
import 'package:flutter/material.dart';

class DoubanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.white),
      home: MainPage(),
    );
  }
}
