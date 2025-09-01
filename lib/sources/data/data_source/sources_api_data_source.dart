import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/sources/data/data_source/sources_data_source.dart';

import '../../../shared/constants/api_constants.dart';
import '../models/sources_response.dart';

class SourcesAPIDataSource implements SourcesDataSource {
  @override
  Future<List<Sources>> getSources(String categoryId) async {
    Uri uri = Uri.https(APIConstants.baseURL, APIConstants.sourcesEndpoint, {
      'apiKey': APIConstants.apiKey,
      'category': categoryId,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
      return sourcesResponse.sources!;
    } else {
      throw Exception('Failed to get sources');
    }
  }
}
