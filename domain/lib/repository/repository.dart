import 'package:dartz/dartz.dart';
import 'package:domain/entities/popular_entity.dart';
import 'package:domain/entities/user_entity.dart';
import 'package:domain/helpers/failure.dart';

abstract class Repository {
  Future<Either<Failure, List<PopularEntity>>> getPopularUsers();
  Future<Either<Failure, UserEntity>> getDetailUser({
    required String username,
  });
}
