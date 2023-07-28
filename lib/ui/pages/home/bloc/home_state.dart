part of 'home_bloc.dart';


abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  String? message;
  HomeError(this.message);
}

class HomeEmpty extends HomeState {}

class HomeHasData extends HomeState {
Comics? avengersComics;
Comics? latestComics;
Comics? spiderComics;
 HomeHasData({this.latestComics,this.avengersComics,this.spiderComics});
}
