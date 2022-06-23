import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metrics_viewer/app_config.dart';
import 'package:metrics_viewer/injection.dart';
import 'package:metrics_viewer/logging_interceptor.dart';

@module
abstract class DioModule {
  Dio get dio {
    final appConfig = getIt.get<AppConfig>();

    return Dio(
      BaseOptions(
        baseUrl: appConfig.baseUrl,
      ),
    )..interceptors.addAll(
      [
        LoggingInterceptor(),
      ],
    );
  }
}
