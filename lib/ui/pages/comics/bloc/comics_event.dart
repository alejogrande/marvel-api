part of 'comics_bloc.dart';

abstract class ComicsEvent {}

class LoadComics extends ComicsEvent {
  String? name;
  int? offset;
  LoadComics({this.name,this.offset});
}

class LoadSearchComics extends ComicsEvent {
  String? name;
  LoadSearchComics({this.name});
}
