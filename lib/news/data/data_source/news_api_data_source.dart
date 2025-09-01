import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../shared/constants/api_constants.dart';
import '../models/news_response.dart';
import 'news_data_source.dart';

class NewsAPIDataSource implements NewsDataSource {
  @override
  Future<List<Articles>> getNews(String sourceId) async {
    Uri uri = Uri.https(APIConstants.baseURL, APIConstants.newsEndpoint, {
      'apiKey': APIConstants.apiKey,
      'sources': sourceId,
    });
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.articles != null) {
      return newsResponse.articles!;
    } else {
      throw Exception('Failed to get news');
    }
  }
}
