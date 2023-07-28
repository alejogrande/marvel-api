import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_api/domain/entities/comics_entity.dart';
import 'package:marvel_api/domain/use_cases/get_marvel_api.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetMarvelApi _getMarvelApi;
  HomeBloc(this._getMarvelApi) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is LoadComicsHome) {
        emit(HomeLoading());
        final responseLatestComic = await _getMarvelApi.getComics(
            offset: event.offset, name: event.name, dateDescriptor: "lastWeek");
        await responseLatestComic.fold(
          (failureLatestComic) {
            emit(HomeError(failureLatestComic.message));
          },
          (dataLatestComic) async {
            final responseAvengersComics = await _getMarvelApi.getComics(
                offset: event.offset, name: "avengers");
            await responseAvengersComics.fold(
              (failureAvengersComics) {
                emit(HomeError(failureAvengersComics.message));
              },
              (dataAvengersComics) async {
                final responseSpider = await _getMarvelApi.getComics(
                    offset: event.offset, name: 'spider');
                responseSpider.fold(
                  (failureSpider) {
                    emit(HomeError(failureSpider.message));
                  },
                  (dataSpider) {
                    emit(HomeHasData(latestComics: dataLatestComic, avengersComics: dataAvengersComics ,spiderComics: dataSpider));
                  },
                );
                // emit(HomeHasData(data: dataAvengersComics));
              },
            );
            // emit(HomeHasData(data: dataLatestComic));
          },
        );
      }
    });
  }
}
