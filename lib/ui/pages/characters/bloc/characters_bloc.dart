
// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_api/domain/entities/characters_entity.dart';
import 'package:marvel_api/domain/use_cases/get_marvel_api.dart';


part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetMarvelApi _getMarvelApi;
  CharactersBloc(this._getMarvelApi) : super(CharactersInitial()) {
   
   on<CharactersEvent>((event, emit) async {
      if (event is LoadCharacters) {
        emit(CharactersLoading());
        final response =
            await _getMarvelApi.getCharacters(offset: event.offset,name: event.name);
        response.fold(
          (failure) {
            emit(CharactersError(failure.message));
          },
          (data) {
            emit(CharactersHasData(data: data));
          },
        );
      }
       if (event is LoadSearchCharacters) {
        emit(CharactersLoading());
        await _startSearchTimer(event.name);
      }
    });
  }

  Timer? _searchTimer;
  _startSearchTimer(String? name) async {
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(milliseconds: 500), () async {
      final response =
          await _getMarvelApi.getCharacters(name: name);
      response.fold(
        (failure) {
          emit(CharactersError(failure.message));
        },
        (data) {
          emit(CharactersHasData(data: data));
        },
      );
    });
  }
}


