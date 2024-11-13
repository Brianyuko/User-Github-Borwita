import 'package:dartz/dartz.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:domain/helpers/failure.dart';
import 'package:domain/repository/repository.dart';

class GetDetailUser {
  final Repository repository;

  GetDetailUser(this.repository);

  Future<Either<Failure, UserEntity>> call({
    required String username,
  }) {
    return repository.getDetailUser(
      username: username,
    );
  }
}
