import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:user_github_borwita/data/datasources/remote_data_source.dart';
import 'package:user_github_borwita/data/repositories/repository_impl.dart';
import 'package:user_github_borwita/presentation/blocs/search_user/search_user_bloc.dart';
import 'package:user_github_borwita/utils/api_client.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // Bloc
  locator.registerFactory(() => SearchUserBloc(getPopularUsers: locator()));

  // Use Case
  locator.registerLazySingleton(() => GetPopularUsers(locator()));

  // Repository
  locator.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // Data Source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // Others
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton<ApiClient>(() => ApiClient());
}
