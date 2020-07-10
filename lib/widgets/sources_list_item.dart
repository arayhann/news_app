import 'package:flutter/material.dart';
import 'package:newsapp/model/category_color.dart';
import 'package:newsapp/provider/sources.dart';
import 'package:newsapp/screens/news_article_screen.dart';
import 'package:provider/provider.dart';

class SourcesListItem extends StatelessWidget {
  final id;
  final name;
  final description;
  final category;

  SourcesListItem({this.id, this.name, this.description, this.category});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          NewsArticleScreen.routeName,
          arguments: id,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: Container(
            color: CategoryColor(category).categoryColor,
          ),
          header: GridTileBar(
            title: Text(name),
            backgroundColor: Colors.black54,
          ),
          footer: Padding(
            padding: EdgeInsets.only(
              bottom: 20,
              top: 10,
              left: 10,
              right: 10,
            ),
            child: Text(
              description,
              style: TextStyle(color: Colors.white),
              maxLines: 2,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ),
    );
  }
}
