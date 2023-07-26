import 'package:dartz/dartz.dart';
import 'package:marvel_api/data/failure.dart';


abstract class MarvelRepository {
  Future<Either<Failure, dynamic>> getCharacters();
}