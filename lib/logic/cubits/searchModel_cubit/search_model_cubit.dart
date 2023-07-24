import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_assignment/data/models/searchModel/search_model.dart';
import 'package:internship_assignment/data/repositories/searchmodel_repository.dart';
import 'package:internship_assignment/logic/cubits/searchModel_cubit/search_model_state.dart';

class SearchModelCubit extends Cubit<SearchModelState> {
  SearchModelCubit() : super(SearchModelInitialState());

  final SearchModelRepository _searchModelRepository = SearchModelRepository();

  void loadData(String modelName) async {
    if (modelName.length >= 2) {
      emit(SearchModelLoadingState(state.makes, state.models));

      try {
        SearchModel searchModel = await _searchModelRepository.fetchSearchModels(modelName);

        List<String> makes = searchModel.makes!;
        List<String> models = searchModel.models!;
        emit(SearchModelLoadedState(makes, models));
      } catch (e) {
        emit(SearchModelErrorState(e.toString(), state.makes, state.models));
      }
    } else if (modelName.isEmpty) {
      clearData();
    }
  }

  void clearData() {
    emit(SearchModelInitialState());
  }
}
