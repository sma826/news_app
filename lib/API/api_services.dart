import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/API/api_constants.dart';
import 'package:news_application/models/news_response.dart';
import 'package:news_application/models/sources_response.dart';

class APIServices {
  static Future<SourcesResponse> getSources(String categoryId) async {
    Uri uri = Uri.https(APIConstants.baseURL, APIConstants.sourcesEndpoint, {
      'apiKey': APIConstants.apiKey,
      'category': categoryId,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    Uri uri = Uri.https(APIConstants.baseURL, APIConstants.newsEndpoint, {
      'apiKey': APIConstants.apiKey,
      'sources': sourceId,
    });
    http.Response response = await http.get(uri);
    print('Response Body : ${response.body}');
    Map<String, dynamic> json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
