part of 'characters_bloc.dart';


abstract class CharactersEvent {}

class LoadCharacters extends CharactersEvent {
  String? name;
  int? offset;
  LoadCharacters({this.name,this.offset});
}

class LoadSearchCharacters extends CharactersEvent {
  String? name;
  LoadSearchCharacters({this.name});
}


