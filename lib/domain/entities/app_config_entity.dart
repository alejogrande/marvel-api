class AppConfig {
  AppConfig({
    required this.baseUrl,
    required this.hash,
    required this.ts,
    required this.apiKey,
    required this.connectTimeOut,
    required this.receiveTimeOut,

  });


  final String baseUrl;
  final String apiKey;
  final String hash;
  final int ts;
  final int connectTimeOut;
  final int receiveTimeOut;
}
