abstract class SearchModelState {
  final List<String> makes;
  final List<String> models;

  SearchModelState(this.makes, this.models);
}

class SearchModelInitialState extends SearchModelState {
  SearchModelInitialState() : super([], []);
}

class SearchModelLoadingState extends SearchModelState {
  SearchModelLoadingState(super.makes, super.models);
}

class SearchModelLoadedState extends SearchModelState {
  SearchModelLoadedState(super.makes, super.models);
}

class SearchModelErrorState extends SearchModelState {
  final String message;
  SearchModelErrorState(this.message, super.makes, super.models);
}
