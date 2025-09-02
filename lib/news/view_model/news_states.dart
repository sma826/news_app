import 'package:news_application/news/data/models/news_response.dart';

abstract class NewsStates {}

class NewsInitial extends NewsStates {}

class GetNewsLoading extends NewsStates {}

class GetNewsSuccess extends NewsStates {
  List<Articles> newsList;

  GetNewsSuccess(this.newsList);
}

class GetNewsError extends NewsStates {
  String message;

  GetNewsError(this.message);
}
