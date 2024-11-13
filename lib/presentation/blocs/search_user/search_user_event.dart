part of 'search_user_bloc.dart';

sealed class SearchUserEvent extends Equatable {
  const SearchUserEvent();
}

final class PopularUsersFetchEvent extends SearchUserEvent {
  @override
  List<Object?> get props => [];
}
