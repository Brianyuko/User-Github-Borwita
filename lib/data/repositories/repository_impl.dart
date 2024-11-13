import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:user_github_borwita/data/datasources/local_data_source.dart';
import 'package:user_github_borwita/data/datasources/remote_data_source.dart';
import 'package:user_github_borwita/data/models/user_model.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

  RepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<PopularEntity>>> getPopularUsers() async {
    try {
      final result = await remoteDataSource.getPopularModelUsers();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure('Failed to fetch data from the server'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException {
      return const Left(SSLFailure('Certificate verification failed'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> getDetailUser({
    required String username,
  }) async {
    try {
      final result = await remoteDataSource.getUserModel(username: username);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Failed to fetch data from the server'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    } on TlsException {
      return const Left(SSLFailure('Certificate verification failed'));
    }
  }

  @override
  Future<Either<Failure, String>> saveFavorite(
      {required UserEntity user}) async {
    try {
      final result = await localDataSource.insertFavorite(
          user: UserModel.fromEntity(user));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> removeFavorite(
      {required UserEntity user}) async {
    try {
      final result = await localDataSource.removeFavorite(
          user: UserModel.fromEntity(user));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<bool> isAddedToFavorite({required int id}) async {
    final result = await localDataSource.getFavoriteById(id: id);
    return result != null;
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getFavorites() async {
    final result = await localDataSource.getFavorites();
    return Right(result.map((e) => e.toEntity()).toList());
  }
}
