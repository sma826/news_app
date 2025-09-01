import 'package:news_application/news/data/models/news_response.dart';

abstract class NewsDataSource {
  Future<List<Articles>> getNews(String sourceId);
}