import 'package:flutter/material.dart';
import 'package:news_application/news/data/models/news_response.dart';
import 'package:news_application/news/data/repositories/news_repository.dart';
import 'package:news_application/shared/service_locator.dart';

class NewsViewModel with ChangeNotifier {
  late NewsRepository repository;

  NewsViewModel() {
    repository = NewsRepository(ServiceLocator.newsDataSource);
  }

  List<Articles> newsList = [];
  bool isLoading = false;

  String? errorMessage;

  Future<void> getNews(String sourceId) async {
    isLoading = true;
    try {
      newsList = await repository.getNews(sourceId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
