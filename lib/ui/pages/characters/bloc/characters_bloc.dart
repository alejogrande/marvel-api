
import 'package:flutter_bloc/flutter_bloc.dart';


part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersInitial()) {
    on<CharactersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
