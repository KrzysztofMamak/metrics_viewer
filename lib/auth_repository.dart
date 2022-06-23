import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metrics_viewer/auth_api.dart';
import 'package:metrics_viewer/auth_failure.dart';
import 'package:metrics_viewer/i_auth_repository.dart';
import 'package:metrics_viewer/login_request.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  AuthRepository(Dio dio) : _authApi = AuthApi(dio);

  final AuthApi _authApi;

  @override
  Future<Either<AuthFailure, Unit>> auth() async {
    final result = await _authApi.auth();
    return Future.delayed(
        const Duration(seconds: 2), () => Left(AuthFailure()));
  }

  @override
  Future<Either<AuthFailure, Unit>> signIn(LoginRequest loginRequest) async {
    try {
      await _authApi.signIn(loginRequest);
      return right(unit);
    } catch (e) {
      return left(AuthFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signup() {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
