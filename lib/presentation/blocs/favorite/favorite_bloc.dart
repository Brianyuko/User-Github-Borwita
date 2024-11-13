import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetFavorites getFavorites;
  FavoriteBloc({
    required this.getFavorites,
  }) : super(FavoriteEmpty()) {
    on<FavoriteFetchEvent>((event, emit) async {
      emit(FavoriteLoading());
      final result = await getFavorites.call();
      result.fold(
        (failure) => emit(FavoriteError(failure.message)),
        (users) => emit(FavoriteLoaded(users)),
      );
    });
  }
}
