import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_application/news/data/models/news_response.dart';
import 'package:news_application/shared/constants/api_constants.dart';
import 'package:news_application/sources/data/models/sources_response.dart';

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

  static Future<List<Articles>> fetchNews(String? categoryId) async {
    try {
      final url = categoryId == null
          ? Uri.parse("${APIConstants
          .baseURLSearch}/top-headlines?country=us&apiKey=${APIConstants
          .apiKey}")
          : Uri.parse("${APIConstants
          .baseURLSearch}/top-headlines?country=us&category=$categoryId&apiKey=${APIConstants
          .apiKey}");

      print("Fetching news from: $url");

      final response = await http.get(url);
      print("Status code: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final newsResponse = NewsResponse.fromJson(data);
        print("Articles fetched: ${newsResponse.articles?.length}");
        return newsResponse.articles ?? [];
      } else {
        throw Exception("Failed to load news: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching news: $e");
      throw Exception("Error fetching news: $e");
    }
  }


// static Future<List<Articles>> fetchNews(String? categoryId) async {
//   try {
//     final url = categoryId == null
//         ? Uri.parse("$APIConstants.baseURL/top-headlines?country=us&apiKey=$APIConstants.apiKey")
//         : Uri.parse("$APIConstants.baseURL/top-headlines?country=us&category=$categoryId&apiKey=$APIConstants.apiKey");
//
//     final response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       final newsResponse = NewsResponse.fromJson(data);
//       return newsResponse.articles ?? [];
//     } else {
//       throw Exception("Failed to load news: ${response.statusCode}");
//     }
//   } catch (e) {
//     throw Exception("Error fetching news: $e");
//   }
// }
}
