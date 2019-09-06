import 'dart:convert';

import 'package:douban_movie/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  WebViewController _controller;
  double _webViewHeight = 1000;

  String _html(html) {
    final str = base64Encode(
      const Utf8Encoder().convert('''
      <!DOCTYPE html>
      <html>
        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <meta http-equiv="X-UA-Compatible" content="ie=edge">
        </head>
        <body>$html</body>
      </html>
      '''),
    );
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewBloc, ReviewState>(
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(
            state is ReviewLoaded ? state.review.subject.title : 'loading...',
          ),
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: state is ReviewLoaded
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        state.review.title,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 15.0,
                            backgroundImage:
                                NetworkImage(state.review.user.avatar),
                          ),
                          SizedBox(width: 5.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                state.review.user.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                state.review.createdAt.split(' ').first,
                                style: TextStyle(fontSize: 11.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: _webViewHeight,
                      child: WebView(
                        javascriptMode: JavascriptMode.unrestricted,
                        debuggingEnabled: true,
                        initialUrl:
                            'data:text/html;base64,${_html(state.review.html)}',
                        onWebViewCreated: (controller) {
                          setState(() {
                            _controller = controller;
                          });
                        },
                        onPageFinished: (url) async {
                          final scrollHeight =
                              await _controller?.evaluateJavascript(
                                  '(() => document.body.scrollHeight)();');
                          print(scrollHeight);
                          if (scrollHeight != null) {
                            setState(() {
                              _webViewHeight = double.parse(scrollHeight) + 20.0;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
