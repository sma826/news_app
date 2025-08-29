import 'package:flutter/material.dart';
import 'package:news_application/sources/data/data_source/sources_data_source.dart';
import 'package:news_application/sources/data/models/sources_response.dart';

class SourcesViewModel with ChangeNotifier {
  SourcesDataSource dataSource = SourcesDataSource();
  List<Sources> sources = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    try {
      SourcesResponse response = await dataSource.getSources(categoryId);
      if (response.status == 'ok' && response.sources != null) {
        sources = response.sources!;
      } else {
        errorMessage = 'Failed to get sources';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
