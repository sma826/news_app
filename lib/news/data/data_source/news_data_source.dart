import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../shared/constants/api_constants.dart';
import '../models/news_response.dart';

class NewsDataSource {
  Future<NewsResponse> getNews(String sourceId) async {
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
