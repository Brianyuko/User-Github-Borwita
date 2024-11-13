part of 'favorite_status_bloc.dart';

class FavoriteStatusState extends Equatable {
  final bool status;
  final String message;

  const FavoriteStatusState(this.status, this.message);

  @override
  List<Object> get props => [status, message];
}
