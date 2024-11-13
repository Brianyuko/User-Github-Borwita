import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:domain/domain.dart';
import 'package:user_github_borwita/data/datasources/remote_data_source.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;

  RepositoryImpl({
    required this.remoteDataSource,
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
}
