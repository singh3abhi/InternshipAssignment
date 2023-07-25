import 'package:internship_assignment/constants/global_variables.dart';

abstract class GetFiltersState {
  final List<FilterDataItem> filtersData;
  GetFiltersState(this.filtersData);
}

class GetFiltersInitialState extends GetFiltersState {
  GetFiltersInitialState() : super(GlobalVariables.filtersList);
}

class GetFiltersLoadingState extends GetFiltersState {
  GetFiltersLoadingState(super.filtersData);
}

class GetFiltersLoadedState extends GetFiltersState {
  GetFiltersLoadedState(super.filtersData);
}

class GetFiltersErrorState extends GetFiltersState {
  final String message;
  GetFiltersErrorState(this.message, super.filtersData);
}
