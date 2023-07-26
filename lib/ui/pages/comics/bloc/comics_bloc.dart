import 'package:flutter_bloc/flutter_bloc.dart';

part 'comics_event.dart';
part 'comics_state.dart';

class ComicsBloc extends Bloc<ComicsEvent, ComicsState> {
  ComicsBloc(Object object) : super(ComicsInitial()) {
    on<ComicsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
