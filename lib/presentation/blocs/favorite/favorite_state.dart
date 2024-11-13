part of 'favorite_bloc.dart';

sealed class FavoriteState extends Equatable {}

final class FavoriteLoading extends FavoriteState {
  @override
  List<Object?> get props => [];
}

final class FavoriteEmpty extends FavoriteState {
  @override
  List<Object?> get props => [];
}

final class FavoriteLoaded extends FavoriteState {
  final List<UserEntity> users;

  FavoriteLoaded(this.users);

  @override
  List<Object> get props => [users];
}

final class FavoriteError extends FavoriteState {
  final String error;

  FavoriteError(this.error);

  @override
  List<Object> get props => [error];
}
