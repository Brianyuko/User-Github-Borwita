part of 'detail_user_bloc.dart';

sealed class DetailUserState extends Equatable {}

final class DetailUserLoading extends DetailUserState {
  @override
  List<Object?> get props => [];
}

final class DetailUserEmpty extends DetailUserState {
  @override
  List<Object?> get props => [];
}

final class DetailUserLoaded extends DetailUserState {
  final UserEntity user;

  DetailUserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

final class DetailUserError extends DetailUserState {
  final String error;

  DetailUserError(this.error);

  @override
  List<Object> get props => [error];
}
