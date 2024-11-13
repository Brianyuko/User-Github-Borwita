import 'package:dartz/dartz.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:domain/helpers/failure.dart';
import 'package:domain/repository/repository.dart';

class SaveFavorite {
  final Repository repository;

  SaveFavorite(this.repository);

  Future<Either<Failure, String>> call({
    required UserEntity user,
  }) {
    return repository.saveFavorite(
      user: user,
    );
  }
}
