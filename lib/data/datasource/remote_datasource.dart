// ignore_for_file: library_prefixes

import 'package:dio/dio.dart';
import 'package:marvel_api/data/exception.dart';
import 'package:marvel_api/data/model/characters_model.dart' as characterModel;
import 'package:marvel_api/data/model/comics_model.dart' as comicModel;
import 'package:marvel_api/domain/entities/characters_entity.dart';
import 'package:marvel_api/domain/entities/comics_entity.dart';

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

  Future<Characters> getCharacters({int? offset, String? name}) async {
    final Map<String, dynamic> queryParams = {
      'offset': offset ?? 0,
    };
    if (name != null && name.isNotEmpty) {
      queryParams['nameStartsWith'] = name;
    }
    final apiResponse = await _client
        .get('/characters', queryParameters: queryParams)
        .catchError((error) {
      return error.response;
    });
    if (apiResponse.statusCode == 200) {
      return characterModel.CharactersModel.fromJson((apiResponse.data));
    } else {
      throw ServerException();
    }
  }
    Future<Comics> getComics({int? offset, String? name,String? dateDescriptor}) async {
    final Map<String, dynamic> queryParams = {
      'offset': offset ?? 0,
    };
    if (name != null && name.isNotEmpty) {
      queryParams['titleStartsWith'] = name;
    }
       if (dateDescriptor != null && dateDescriptor.isNotEmpty) {
      queryParams['dateDescriptor'] = dateDescriptor;
    }
    
    final apiResponse = await _client
        .get('/comics', queryParameters: queryParams)
        .catchError((error) {
      return error.response;
    });
    if (apiResponse.statusCode == 200) {
       return comicModel.ComicsModel.fromJson((apiResponse.data));
      
  
    } else {
      throw ServerException();
    }
  }
}
