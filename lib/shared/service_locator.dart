import 'package:news_application/news/data/data_source/news_api_data_source.dart';
import 'package:news_application/news/data/data_source/news_data_source.dart';
import 'package:news_application/sources/data/data_source/sources_api_data_source.dart';
import 'package:news_application/sources/data/data_source/sources_data_source.dart';

class ServiceLocator {
  static NewsDataSource newsDataSource = NewsAPIDataSource();
  static SourcesDataSource sourcesDataSource = SourcesAPIDataSource();
}
