sealed class HomeState {}


 class HomeInitial extends HomeState {}
 class HomeLoading extends HomeState {}
 class HomeSuccess<T> extends HomeState {
  T? data;
  HomeSuccess({this.data});
}

 class HomeError extends HomeState {
  final String? errorMessage;

  HomeError({required this.errorMessage});
}
