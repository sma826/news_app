import 'package:flutter/material.dart';
import 'package:news_application/shared/service_locator.dart';
import 'package:news_application/sources/data/models/sources_response.dart';
import 'package:news_application/sources/data/repositories/sources_repository.dart';

class SourcesViewModel with ChangeNotifier {
  late SourcesRepository repository;

  SourcesViewModel() {
    repository = SourcesRepository(ServiceLocator.sourcesDataSource);
  }

  List<Sources> sources = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> getSources(String categoryId) async {
    isLoading = true;
    try {
      sources = await repository.getSources(categoryId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
