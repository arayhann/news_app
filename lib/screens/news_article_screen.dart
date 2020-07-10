import 'package:flutter/material.dart';
import 'package:newsapp/provider/articles.dart';
import 'package:newsapp/screens/article_detail_screen.dart';
import 'package:newsapp/widgets/search_text_fields.dart';
import 'package:provider/provider.dart';

class NewsArticleScreen extends StatefulWidget {
  static const routeName = '/news-article';

  @override
  _NewsArticleScreenState createState() => _NewsArticleScreenState();
}

class _NewsArticleScreenState extends State<NewsArticleScreen> {
  var _isInit = true;
  @override
  void didChangeDependencies() {
    if (_isInit) {
      final articleId = ModalRoute.of(context).settings.arguments as String;
      Provider.of<Articles>(context).fetchAndSetSources(articleId);
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final articleData = Provider.of<Articles>(context).items;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SearchTextField(),
            Expanded(
              child: articleData.length == 0
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: articleData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              leading: FadeInImage(
                                placeholder:
                                    AssetImage('images/placeholder.png'),
                                image: articleData[index].urlToImage == null
                                    ? AssetImage('images/placeholder.png')
                                    : NetworkImage(
                                        articleData[index].urlToImage,
                                      ),
                              ),
                              title: Text(articleData[index].title),
                              subtitle: Text(articleData[index].description),
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                  ArticleDetailScreen.routeName,
                                  arguments: articleData[index].url,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
