import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsapp/model/source.dart';
import 'package:http/http.dart' as http;

class Sources with ChangeNotifier {
  var _activeCategories = 'business';

  List<Source> _items = [
//    Source(
//      id: 'abc-news',
//      name: 'ABC News',
//      description:
//          'Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com.',
//      url: 'https://abcnews.go.com',
//      categories: 'general',
//      language: 'en',
//      country: 'us',
//    ),
//    Source(
//      id: 'ars-technica',
//      name: 'Ars Technica',
//      description:
//          'The PC enthusiast\'s resource. Power users and the tools they love, without computing religion.',
//      url: 'http://arstechnica.com',
//      categories: 'technology',
//      language: 'en',
//      country: 'us',
//    ),
//    Source(
//      id: 'australian-financial-review',
//      name: 'Australian Financial Revie',
//      description:
//          'The Australian Financial Review reports the latest news from business, finance, investment and politics, updated in real time. It has a reputation for independent, award-winning journalism and is essential reading for the business and investor community.',
//      url: 'http://www.afr.com',
//      categories: 'business',
//      language: 'en',
//      country: 'us',
//    ),
  ];

  List<Source> get items {
    return [..._items];
  }

  String get activeCategories {
    final copyCategories = _activeCategories;
    return copyCategories;
  }

  Future<void> setCategories(String category) async {
    _activeCategories = category;
    notifyListeners();
    await fetchAndSetSources();
    notifyListeners();
  }

  Future<void> fetchAndSetSources() async {
    var url =
        'https://newsapi.org/v2/sources?language=en&apiKey=16ddcf2da6ac4c7c903834effaa3113b&category=$_activeCategories';
    try {
      final response = await http.get(
        url,
      );

      final List<Source> loadedSource = [];

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final listSource = extractedData['sources'] as List<dynamic>;

      if (listSource == null) {
        return;
      }

      listSource.forEach((source) {
        loadedSource.add(
          Source(
            id: source['id'],
            name: source['name'],
            description: source['description'],
            url: source['url'],
            categories: source['category'],
            language: source['language'],
            country: source['country'],
          ),
        );
      });

      _items = loadedSource;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
