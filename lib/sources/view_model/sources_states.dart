import 'package:news_application/sources/data/models/sources_response.dart';

abstract class SourcesStates {}

class SourcesInitial extends SourcesStates {}

class GetSourcesLoading extends SourcesStates {}

class GetSourcesSuccess extends SourcesStates {
  List<Sources> sources;

  GetSourcesSuccess(this.sources);
}

class GetSourcesError extends SourcesStates {
  String message;

  GetSourcesError(this.message);
}
