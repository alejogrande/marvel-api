import 'package:dio/dio.dart';
import 'package:marvel_api/data/exception.dart';
import 'package:marvel_api/data/model/characters_model.dart';
import 'package:marvel_api/domain/entities/characters_entity.dart';

class RemoteDataSource {
  late BaseOptions _optionsApi;
  late Dio _client;

  RemoteDataSource({
    required String baseUrl,
    required String hash,
    required String apiKey,
    required int connectTimeout,
    required int receiveTimeOut,
    required int ts,
  }) {
    _optionsApi = BaseOptions(
        baseUrl: baseUrl,
        responseType: ResponseType.json,
        queryParameters: {
          'ts': ts,
          'hash': hash,
          'apikey': apiKey,
          
        },
        headers: {
          'Content-Type': 'application/json',
          'accept': '*/*'
        });
    _client = Dio(_optionsApi);
  }

  addInterceptor(Interceptor interceptor) {
    _client.interceptors.add(interceptor);

    _client.interceptors.add(InterceptorsWrapper(onError: (e, handler) {
      // ignore: unnecessary_null_comparison
      if (e == null) {
        handler.reject(e);
      } else {
        handler.resolve(
            e.response ?? Response(requestOptions: RequestOptions(path: '')));
      }
    }, onRequest: (r, handler) {
      handler.next(r);
    }, onResponse: (r, handler) {
      handler.next(r);
    }));
  }

  Future<Characters> getCharacters() async {
    final apiResponse = await _client.get('/characters').catchError((error) {
      return error.response;
    });
     if (apiResponse.statusCode == 200) {
      return CharactersModel.fromJson((apiResponse.data));
    } else {
      throw ServerException();
    }
  }
}
