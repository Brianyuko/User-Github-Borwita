part of 'favorite_status_bloc.dart';

sealed class FavoriteStatusEvent extends Equatable {
  const FavoriteStatusEvent();
}

final class AddToFavoritesEvent extends FavoriteStatusEvent {
  final UserEntity user;

  const AddToFavoritesEvent({required this.user});

  @override
  List<Object> get props => [user];
}

final class RemoveFromFavoritesEvent extends FavoriteStatusEvent {
  final UserEntity user;

  const RemoveFromFavoritesEvent({required this.user});

  @override
  List<Object> get props => [user];
}

final class LoadFavoritesEvent extends FavoriteStatusEvent {
  final int id;

  const LoadFavoritesEvent({required this.id});

  @override
  List<Object> get props => [id];
}
