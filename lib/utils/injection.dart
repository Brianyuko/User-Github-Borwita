import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:user_github_borwita/data/datasources/db/database_helper.dart';
import 'package:user_github_borwita/data/datasources/local_data_source.dart';
import 'package:user_github_borwita/data/datasources/remote_data_source.dart';
import 'package:user_github_borwita/data/repositories/repository_impl.dart';
import 'package:user_github_borwita/presentation/blocs/detail_user/detail_user_bloc.dart';
import 'package:user_github_borwita/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:user_github_borwita/presentation/blocs/favorite_status/favorite_status_bloc.dart';
import 'package:user_github_borwita/presentation/blocs/search_user/search_user_bloc.dart';
import 'package:user_github_borwita/utils/api_client.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // Bloc
  locator.registerFactory(() => SearchUserBloc(getPopularUsers: locator()));
  locator.registerFactory(() => DetailUserBloc(getDetailUser: locator()));
  locator.registerFactory(() => FavoriteBloc(getFavorites: locator()));
  locator.registerFactory(() => FavoriteStatusBloc(
        getFavoriteStatus: locator(),
        saveFavorite: locator(),
        removeFavorite: locator(),
      ));

  // Use Case
  locator.registerLazySingleton(() => GetPopularUsers(locator()));
  locator.registerLazySingleton(() => GetDetailUser(locator()));
  locator.registerLazySingleton(() => GetFavorites(locator()));
  locator.registerLazySingleton(() => GetFavoriteStatus(locator()));
  locator.registerLazySingleton(() => SaveFavorite(locator()));
  locator.registerLazySingleton(() => RemoveFavorite(locator()));

  // Repository
  locator.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // Data Source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );
  locator.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(
      databaseHelper: locator(),
    ),
  );

  // Others
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton<ApiClient>(() => ApiClient());
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
}
