import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:metrics_viewer/injection.dart';

class LoggingInterceptor extends Interceptor {
  final _logger = getIt.get<Logger>();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _logger.e('DioError', err);
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i('Dio request $options');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i('Dio response $response');
    super.onResponse(response, handler);
  }
}
