part of 'characters_bloc.dart';


abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoading extends CharactersState {}

class CharactersError extends CharactersState {
  String? message;
  CharactersError(this.message);
}

class CharactersEmpty extends CharactersState {}

class CharactersHasData extends CharactersState {
  Characters? data;
  CharactersHasData({this.data});
}