import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:marvel_api/data/datasource/remote_datasource.dart';
import 'package:marvel_api/data/exception.dart';
import 'package:marvel_api/data/failure.dart';
import 'package:marvel_api/domain/entities/characters_entity.dart';
import 'package:marvel_api/domain/repositories/marvel_repository.dart';

import '../../domain/entities/comics_entity.dart';

class MarvelRepositoryImpl implements MarvelRepository {
  final RemoteDataSource remoteDataSource;

  MarvelRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Characters>> getCharacters(
      {int? offset, String? name}) async {
    try {
      final result =
          await remoteDataSource.getCharacters(offset: offset, name: name);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, Comics>> getComics({int? offset, String? name,String? dateDescriptor}) async {
    try {
      final result =
          await remoteDataSource.getComics(offset: offset, name: name,dateDescriptor:dateDescriptor);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
