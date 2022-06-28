import 'dart:async' show unawaited;

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:metrics_viewer/auth_api.dart';
import 'package:metrics_viewer/auth_failure.dart';
import 'package:metrics_viewer/i_auth_repository.dart';
import 'package:metrics_viewer/login_request.dart';
import 'package:metrics_viewer/shared_preferences/sp_keys.dart';
import 'package:metrics_viewer/signup_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  AuthRepository(
    Dio dio,
    this._sharedPreferences,
  ) : _authApi = AuthApi(dio);

  final AuthApi _authApi;
  final SharedPreferences _sharedPreferences;

  @override
  Future<Either<AuthFailure, Unit>> auth() async {
    final result = await _authApi.auth();
    return Future.delayed(
      const Duration(seconds: 2),
      () => Left(AuthFailure()),
    );
  }

  @override
  Future<Either<AuthFailure, Unit>> signIn(LoginRequest loginRequest) async {
    try {
      final result = await _authApi.signIn(loginRequest);
      unawaited(_sharedPreferences.setString(SPKeys.authToken, result));
      return right(unit);
    } catch (e) {
      return left(AuthFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signup(SignupRequest signupRequest) async {
    try {
      await _authApi.signup(signupRequest);
      return right(unit);
    } catch (e) {
      return left(AuthFailure());
    }
  }
}
