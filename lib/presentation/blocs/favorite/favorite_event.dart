part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

final class FavoriteFetchEvent extends FavoriteEvent {
  @override
  List<Object> get props => [];
}
