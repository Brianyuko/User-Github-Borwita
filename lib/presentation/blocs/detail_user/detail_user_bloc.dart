import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'detail_user_event.dart';
part 'detail_user_state.dart';

class DetailUserBloc extends Bloc<DetailUserEvent, DetailUserState> {
  final GetDetailUser getDetailUser;
  DetailUserBloc({
    required this.getDetailUser,
  }) : super(DetailUserEmpty()) {
    on<DetailUserFetchEvent>((event, emit) async {
      emit(DetailUserLoading());
      final result = await getDetailUser.call(
        username: event.username,
      );
      result.fold(
        (failure) => emit(DetailUserError(failure.message)),
        (user) => emit(DetailUserLoaded(user)),
      );
    });
  }
}
