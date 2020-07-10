import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/model/article.dart';
import 'package:http/http.dart' as http;

class Articles with ChangeNotifier {
  List<Article> _items = [];

  List<Article> get items {
    return [..._items];
  }

  Future<void> fetchAndSetSources(String id) async {
    var url =
        'https://newsapi.org/v2/top-headlines?sources=$id&apiKey=16ddcf2da6ac4c7c903834effaa3113b';
    try {
      final response = await http.get(
        url,
      );

      final List<Article> loadedArticle = [];

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final listArticle = extractedData['articles'] as List<dynamic>;

      if (listArticle == null) {
        return;
      }

      listArticle.forEach((article) {
        loadedArticle.add(
          Article(
            author: article['author'],
            title: article['title'],
            description: article['description'],
            url: article['url'],
            urlToImage: article['urlToImage'],
            publishedAt: article['publishedAt'],
            content: article['content'],
          ),
        );
      });

      _items = loadedArticle;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> searchArticle(String searchKey) async {
    var url =
        'https://newsapi.org/v2/everything?q=$searchKey&apiKey=16ddcf2da6ac4c7c903834effaa3113b';
    try {
      final response = await http.get(
        url,
      );

      final List<Article> loadedArticle = [];

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final listArticle = extractedData['articles'] as List<dynamic>;

      if (listArticle == null) {
        return;
      }

      listArticle.forEach((article) {
        loadedArticle.add(
          Article(
            author: article['author'],
            title: article['title'],
            description: article['description'],
            url: article['url'],
            urlToImage: article['urlToImage'],
            publishedAt: article['publishedAt'],
            content: article['content'],
          ),
        );
      });

      _items = loadedArticle;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
