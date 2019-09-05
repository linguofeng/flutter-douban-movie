import 'package:flutter/material.dart';

class PreviewPage extends StatefulWidget {
  final List<String> images;
  final int index;

  const PreviewPage({Key key, this.images, this.index}) : super(key: key);

  @override
  _PreviewPageState createState() =>
      _PreviewPageState(images: images, index: index);
}

class _PreviewPageState extends State<PreviewPage> {
  final List<String> images;
  final _controller;
  int index;

  _PreviewPageState({this.images, this.index})
      : _controller = PageController(initialPage: index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).maybePop();
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  this.index = index;
                });
              },
              controller: _controller,
              itemCount: images.length,
              itemBuilder: (context, index) => Image.network(
                images[index],
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: 20,
              child: Text(
                '${index + 1}/${images.length}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
