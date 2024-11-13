import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'search_user_event.dart';
part 'search_user_state.dart';

class SearchUserBloc extends Bloc<SearchUserEvent, SearchUserState> {
  final GetPopularUsers getPopularUsers;
  SearchUserBloc({
    required this.getPopularUsers,
  }) : super(SearchUserEmpty()) {
    on<PopularUsersFetchEvent>((event, emit) async {
      emit(SearchUserLoading());
      final result = await getPopularUsers.call();
      result.fold(
        (failure) => emit(SearchUserError(failure.message)),
        (users) => emit(SearchUserLoaded(users)),
      );
    });
  }
}
