import 'package:dartz/dartz.dart';
import 'package:marvel_api/data/failure.dart';
import 'package:marvel_api/domain/entities/characters_entity.dart';


abstract class MarvelRepository {
  Future<Either<Failure, Characters>> getCharacters();
}