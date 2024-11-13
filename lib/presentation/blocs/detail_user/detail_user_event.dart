part of 'detail_user_bloc.dart';

sealed class DetailUserEvent extends Equatable {
  const DetailUserEvent();
}

final class DetailUserFetchEvent extends DetailUserEvent {
  final String username;

  const DetailUserFetchEvent({required this.username});

  @override
  List<Object> get props => [username];
}
