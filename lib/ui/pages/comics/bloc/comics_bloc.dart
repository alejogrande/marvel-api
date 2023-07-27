// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_api/domain/use_cases/get_marvel_api.dart';

import '../../../../domain/entities/comics_entity.dart';

part 'comics_event.dart';
part 'comics_state.dart';

class ComicsBloc extends Bloc<ComicsEvent, ComicsState> {
    final GetMarvelApi _getMarvelApi;
  ComicsBloc(this._getMarvelApi) : super(ComicsInitial()) {
    on<ComicsEvent>((event, emit) async {
       if (event is LoadComics) {
        emit(ComicsLoading());
        final response =
            await _getMarvelApi.getComics(offset: event.offset,name: event.name);
        response.fold(
          (failure) {
            emit(ComicsError(failure.message));
          },
          (data) {
            emit(ComicsHasData(data: data));
          },
        );
      }
       if (event is LoadSearchComics) {
        emit(ComicsLoading());
        await _startSearchTimer(event.name);
      }
    });
  }
    Timer? _searchTimer;
   _startSearchTimer(String? name) async {
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(milliseconds: 500), () async {
      final response =
          await _getMarvelApi.getComics(name: name);
      response.fold(
        (failure) {
          emit(ComicsError(failure.message));
        },
        (data) {
          emit(ComicsHasData(data: data));
        },
      );
    });
  }
}
