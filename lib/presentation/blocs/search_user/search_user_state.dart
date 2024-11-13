part of 'search_user_bloc.dart';

sealed class SearchUserState extends Equatable {}

final class SearchUserLoading extends SearchUserState {
  @override
  List<Object?> get props => [];
}

final class SearchUserEmpty extends SearchUserState {
  @override
  List<Object?> get props => [];
}

final class SearchUserLoaded extends SearchUserState {
  final List<PopularEntity> popularUsers;

  SearchUserLoaded(this.popularUsers);

  @override
  List<Object> get props => [popularUsers];
}

final class SearchUserError extends SearchUserState {
  final String error;

  SearchUserError(this.error);

  @override
  List<Object> get props => [error];
}
