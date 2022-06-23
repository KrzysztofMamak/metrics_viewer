import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: '/auth')
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST('/signup')
  Future<void> signup();

  @POST('/sign-in')
  Future<void> signIn();
}
