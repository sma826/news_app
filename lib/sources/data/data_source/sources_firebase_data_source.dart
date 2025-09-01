import 'package:news_application/sources/data/data_source/sources_data_source.dart';
import 'package:news_application/sources/data/models/sources_response.dart';

class SourcesFirebaseDataSource implements SourcesDataSource {
  @override
  Future<List<Sources>> getSources(String categoryId) async {
    return [];
  }
}
