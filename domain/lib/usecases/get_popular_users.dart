import 'package:dartz/dartz.dart';
import 'package:domain/entities/popular_entity.dart';
import 'package:domain/helpers/failure.dart';
import 'package:domain/repository/repository.dart';

class GetPopularUsers {
  final Repository repository;

  GetPopularUsers(this.repository);

  Future<Either<Failure, List<PopularEntity>>> call() {
    return repository.getPopularUsers();
  }
}
