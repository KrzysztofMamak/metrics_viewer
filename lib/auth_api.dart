import 'package:dio/dio.dart';
import 'package:metrics_viewer/login_request.dart';
import 'package:metrics_viewer/signup_request.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: '/auth')
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @GET('')
  Future<HttpResponse> auth();

  @POST('/signup')
  Future<HttpResponse> signup(@Body() SignupRequest signupRequest);

  @POST('/sign-in')
  Future<HttpResponse> signIn(@Body() LoginRequest loginRequest);
}
