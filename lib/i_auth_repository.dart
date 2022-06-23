import 'package:dartz/dartz.dart';
import 'package:metrics_viewer/auth_failure.dart';
import 'package:metrics_viewer/login_request.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, Unit>> auth();

  Future<Either<AuthFailure, Unit>> signup();

  Future<Either<AuthFailure, Unit>> signIn(LoginRequest loginRequest);
}
