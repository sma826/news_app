import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/news/data/models/news_response.dart';
import 'package:news_application/news/data/repositories/news_repository.dart';
import 'package:news_application/news/view_model/news_states.dart';
import 'package:news_application/shared/service_locator.dart';

class NewsViewModel extends Cubit<NewsStates> {
  late NewsRepository repository;

  NewsViewModel() : super(NewsInitial()) {
    repository = NewsRepository(ServiceLocator.newsDataSource);
  }

  Future<void> getNews(String sourceId) async {
    emit(GetNewsLoading());
    try {
      List<Articles> newsList = await repository.getNews(sourceId);
      emit(GetNewsSuccess(newsList));
    } catch (error) {
      emit(GetNewsError(error.toString()));
    }
  }
}
