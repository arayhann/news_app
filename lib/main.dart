import 'package:flutter/material.dart';
import 'package:newsapp/provider/articles.dart';
import 'package:newsapp/provider/sources.dart';
import 'package:newsapp/screens/article_detail_screen.dart';
import 'package:newsapp/screens/home_screens.dart';
import 'package:newsapp/screens/news_article_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return Sources();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return Articles();
          },
        ),
      ],
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
        routes: {
          NewsArticleScreen.routeName: (context) => NewsArticleScreen(),
          ArticleDetailScreen.routeName: (context) => ArticleDetailScreen(),
        },
      ),
    );
  }
}
