import 'package:flutter/material.dart';
import 'package:news_application/news/data/data_source/news_data_source.dart';
import 'package:news_application/news/data/models/news_response.dart';

class NewsViewModel with ChangeNotifier {
  NewsDataSource dataSource = NewsDataSource();
  List<Articles> newsList = [];
  bool isLoading = false;

  String? errorMessage;

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    try {
      NewsResponse response = await dataSource.getNews(sourceId);
      if (response.status == 'ok' && response.articles != null) {
        newsList = response.articles!;
      } else {
        errorMessage = 'Failed to get news';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
