import 'package:dio/dio.dart';

class RemoteDataSource {
  late BaseOptions _optionsApi;
  late Dio _client;

  RemoteDataSource(
      {required String baseUrl,
      required int connectTimeout,
      required int receiveTimeOut}) {
    _optionsApi = BaseOptions(
        baseUrl: baseUrl,
        responseType: ResponseType.json,
        queryParameters: {

        },
        headers: {'Content-Type': 'application/json', 'accept': '*/*'});
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
  Future<dynamic> getCharacters() async {
     return null;
  }
  

 


  
}
