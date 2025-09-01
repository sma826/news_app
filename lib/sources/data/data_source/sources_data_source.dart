import 'package:news_application/sources/data/models/sources_response.dart';

abstract class SourcesDataSource {
  Future<List<Sources>> getSources(String categoryId);
}