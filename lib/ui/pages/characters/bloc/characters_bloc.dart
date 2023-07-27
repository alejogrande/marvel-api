
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
        final resultRecently =
            await _getMarvelApi.getCharacters();
        resultRecently.fold(
          (failure) {
            emit(CharactersError(failure.message));
          },
          (data) {
            emit(CharactersHasData(data: data));
          },
        );
      }
    });
  }
}


