part of 'home_bloc.dart';


abstract class HomeEvent {}

class LoadComicsHome extends HomeEvent {
  String? name;
  int? offset;
  LoadComicsHome({this.name,this.offset});
}

class LoadSearchComicsHome extends HomeEvent {
  String? name;
  LoadSearchComicsHome({this.name});
}
