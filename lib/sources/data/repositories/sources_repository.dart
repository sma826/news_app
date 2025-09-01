import 'package:news_application/sources/data/data_source/sources_data_source.dart';

import '../models/sources_response.dart';

class SourcesRepository {
  SourcesDataSource dataSource;

  SourcesRepository(this.dataSource);

  Future<List<Sources>> getSources(String categoryId) async {
    return dataSource.getSources(categoryId);
  }
}
