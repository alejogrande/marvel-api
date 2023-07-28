import 'package:dartz/dartz.dart';
import 'package:marvel_api/data/failure.dart';
import 'package:marvel_api/domain/entities/characters_entity.dart';
import 'package:marvel_api/domain/repositories/marvel_repository.dart';

import '../entities/comics_entity.dart';


class GetMarvelApi {
  final MarvelRepository repository;

  GetMarvelApi(this.repository);

  Future<Either<Failure, Characters>> getCharacters({int? offset,String? name}) {
    return repository.getCharacters(offset: offset,name: name);
  }

    Future<Either<Failure, Comics>> getComics({int? offset,String? name,String? dateDescriptor}) {
    return repository.getComics(offset: offset,name: name,dateDescriptor: dateDescriptor);
  }


  
}
