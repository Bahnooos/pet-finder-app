// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class FavoriteState {}

class FavoriteInitialState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteSuccessState<T> extends FavoriteState {
  T? data;
  FavoriteSuccessState({this.data});
}

class FavoriteErrorState extends FavoriteState {
  final String? errorMessage;

  FavoriteErrorState({required this.errorMessage});
}
