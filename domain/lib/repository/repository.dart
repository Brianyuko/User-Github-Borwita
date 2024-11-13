import 'package:dartz/dartz.dart';
import 'package:domain/entities/popular_entity.dart';
import 'package:domain/helpers/failure.dart';

abstract class Repository {
  Future<Either<Failure, List<PopularEntity>>> getPopularUsers();
}
