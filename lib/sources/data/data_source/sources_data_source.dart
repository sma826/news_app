import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../shared/constants/api_constants.dart';
import '../models/sources_response.dart';

class SourcesDataSource {
  Future<SourcesResponse> getSources(String categoryId) async {
    Uri uri = Uri.https(APIConstants.baseURL, APIConstants.sourcesEndpoint, {
      'apiKey': APIConstants.apiKey,
      'category': categoryId,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }
}
