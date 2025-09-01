import 'package:news_application/news/data/data_source/news_data_source.dart';
import 'package:news_application/news/data/models/news_response.dart';

class NewsRepository {
  NewsDataSource dataSource;

  NewsRepository(this.dataSource);

  Future<List<Articles>> getNews(String sourceId) async {
    return dataSource.getNews(sourceId);
  }
}
