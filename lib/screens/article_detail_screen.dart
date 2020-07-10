import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailScreen extends StatelessWidget {
  static const routeName = '/article-detail';
  @override
  Widget build(BuildContext context) {
    final articleUrl = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return WebView(
            initialUrl: articleUrl,
          );
        },
      ),
    );
  }
}
