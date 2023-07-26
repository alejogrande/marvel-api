import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:marvel_api/data/datasource/remote_datasource.dart';
import 'package:marvel_api/data/exception.dart';
import 'package:marvel_api/data/failure.dart';
import 'package:marvel_api/domain/repositories/marver_repository.dart';


class MarvelRepositoryImpl implements MarvelRepository {
  final RemoteDataSource remoteDataSource;

  MarvelRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, dynamic>> getCharacters() async {
    try {
      final result = await remoteDataSource.getCharacters();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

 
}
