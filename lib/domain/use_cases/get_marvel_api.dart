import 'package:dartz/dartz.dart';
import 'package:marvel_api/data/failure.dart';
import 'package:marvel_api/domain/repositories/marvel_repository.dart';


class GetMarvelApi {
  final MarvelRepository repository;

  GetMarvelApi(this.repository);

  Future<Either<Failure, dynamic>> getCharacters() {
    return repository.getCharacters();
  }

  
}
