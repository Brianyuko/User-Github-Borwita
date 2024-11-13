import 'package:dartz/dartz.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:domain/helpers/failure.dart';
import 'package:domain/repository/repository.dart';

class GetFavorites {
  final Repository repository;

  GetFavorites(this.repository);

  Future<Either<Failure, List<UserEntity>>> call() {
    return repository.getFavorites();
  }
}
