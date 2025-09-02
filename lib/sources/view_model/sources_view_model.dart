import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/shared/service_locator.dart';
import 'package:news_application/sources/data/models/sources_response.dart';
import 'package:news_application/sources/data/repositories/sources_repository.dart';
import 'package:news_application/sources/view_model/sources_states.dart';

class SourcesViewModel extends Cubit<SourcesStates> {
  late SourcesRepository repository;

  SourcesViewModel() : super(SourcesInitial()) {
    repository = SourcesRepository(ServiceLocator.sourcesDataSource);
  }

  Future<void> getSources(String categoryId) async {
    emit(GetSourcesLoading());
    try {
      List<Sources> sources = await repository.getSources(categoryId);
      emit(GetSourcesSuccess(sources));
    } catch (error) {
      emit(GetSourcesError(error.toString()));
    }
  }
}
