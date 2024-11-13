import 'package:domain/helpers/exception.dart';
import 'package:user_github_borwita/data/datasources/db/database_helper.dart';
import 'package:user_github_borwita/data/models/user_model.dart';

abstract class LocalDataSource {
  Future<String> insertFavorite({required UserModel user});
  Future<String> removeFavorite({required UserModel user});
  Future<UserModel?> getFavoriteById({required int id});
  Future<List<UserModel>> getFavorites();
}

class LocalDataSourceImpl implements LocalDataSource {
  final DatabaseHelper databaseHelper;

  LocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertFavorite({required UserModel user}) async {
    try {
      await databaseHelper.insertFavorite(user: user);
      return 'Added to favorite';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeFavorite({required UserModel user}) async {
    try {
      await databaseHelper.removeFavorite(user: user);
      return 'Removed from favorite';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<UserModel?> getFavoriteById({required int id}) async {
    final result = await databaseHelper.getFavoriteById(id: id);
    if (result != null) {
      return UserModel.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<UserModel>> getFavorites() async {
    final result = await databaseHelper.getFavorites();
    return result.map((e) => UserModel.fromMap(e)).toList();
  }
}
