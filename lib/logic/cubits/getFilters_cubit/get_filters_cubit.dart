import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_assignment/constants/global_variables.dart';
import 'package:internship_assignment/data/models/getFilters/filter_item_model.dart';
import 'package:internship_assignment/data/repositories/filter_repository.dart';
import 'package:internship_assignment/logic/cubits/getFilters_cubit/get_filters_state.dart';

class GetFiltersCubit extends Cubit<GetFiltersState> {
  GetFiltersCubit() : super(GetFiltersInitialState());

  final FilterRepository _filterRepository = FilterRepository();

  void intialize() async {
    emit(GetFiltersLoadingState(state.filtersData));

    try {
      FiltersModel filtersModel = await _filterRepository.fetchFilters();
      final List<FilterDataItem> filtersList = [
        FilterDataItem(
          name: 'Brand',
          filterList: filtersModel.make!,
        ),
        FilterDataItem(
          name: 'Ram',
          filterList: filtersModel.ram!,
        ),
        FilterDataItem(
          name: 'Storage',
          filterList: filtersModel.storage!,
        ),
        FilterDataItem(
          name: 'Conditions',
          filterList: filtersModel.condition!,
        ),
        const FilterDataItem(
          name: 'Warranty',
          filterList: [
            'Brand Warranty',
            'Seller Warranty'
          ],
        ),
        const FilterDataItem(
          name: 'Verification',
          filterList: [
            'Verified'
          ],
        ),
      ];

      emit(GetFiltersLoadedState(filtersList));
    } catch (e) {
      emit(GetFiltersErrorState(e.toString(), state.filtersData));
    }
  }
}
