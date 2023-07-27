import 'package:dartz/dartz.dart';
import 'package:marvel_api/data/failure.dart';
import 'package:marvel_api/domain/entities/characters_entity.dart';
import 'package:marvel_api/domain/repositories/marvel_repository.dart';


class GetMarvelApi {
  final MarvelRepository repository;

  GetMarvelApi(this.repository);

  Future<Either<Failure, Characters>> getCharacters({int? offset,String? name}) {
    return repository.getCharacters(offset: offset,name: name);
  }

  
}
