import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'favorite_status_event.dart';
part 'favorite_status_state.dart';

class FavoriteStatusBloc
    extends Bloc<FavoriteStatusEvent, FavoriteStatusState> {
  static const addSuccessMessage = 'Added to favorite';
  static const removeSuccessMessage = 'Removed from favorite';
  final GetFavoriteStatus getFavoriteStatus;
  final SaveFavorite saveFavorite;
  final RemoveFavorite removeFavorite;
  FavoriteStatusBloc({
    required this.getFavoriteStatus,
    required this.saveFavorite,
    required this.removeFavorite,
  }) : super(const FavoriteStatusState(false, '')) {
    on<AddToFavoritesEvent>((event, emit) async {
      String msg = '';
      final result = await saveFavorite.call(
        user: event.user,
      );
      result.fold(
        (failure) => msg = failure.message,
        (message) => msg = addSuccessMessage,
      );
      final status = await getFavoriteStatus.call(
        id: event.user.id,
      );
      emit(FavoriteStatusState(status, msg));
    });

    on<RemoveFromFavoritesEvent>((event, emit) async {
      String msg = '';
      final result = await removeFavorite.call(
        user: event.user,
      );
      result.fold(
        (failure) => msg = failure.message,
        (message) => msg = removeSuccessMessage,
      );
      final status = await getFavoriteStatus.call(
        id: event.user.id,
      );
      emit(FavoriteStatusState(status, msg));
    });

    on<LoadFavoritesEvent>((event, emit) async {
      final status = await getFavoriteStatus.call(
        id: event.id,
      );
      emit(FavoriteStatusState(status, ''));
    });
  }
}
