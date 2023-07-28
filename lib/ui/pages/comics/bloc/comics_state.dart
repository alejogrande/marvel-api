part of 'comics_bloc.dart';

abstract class ComicsState {}

class ComicsInitial extends ComicsState {}

class ComicsLoading extends ComicsState {}

class ComicsError extends ComicsState {
  String? message;
  ComicsError(this.message);
}

class ComicsEmpty extends ComicsState {}

class ComicsHasData extends ComicsState {
  Comics? data;
  ComicsHasData({this.data});
}
