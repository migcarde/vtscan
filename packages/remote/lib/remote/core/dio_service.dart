import 'package:dio/dio.dart';

class DioService {
  static Dio instance(String apiKey) {
    final dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
    );

    dio.interceptors
      ..add(LogInterceptor(requestBody: true, responseBody: true))
      ..add(
        QueuedInterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers['x-apikey'] = apiKey;

            return handler.next(options);
          },
        ),
      );

    return dio;
  }
}
