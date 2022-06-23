// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i6;

import 'app_router.dart' as _i10;
import 'auth_guard.dart' as _i9;
import 'auth_repository.dart' as _i5;
import 'dio_module.dart' as _i11;
import 'i_auth_repository.dart' as _i4;
import 'logger_module.dart' as _i12;
import 'sign_in_form_bloc/sign_in_form_bloc.dart' as _i7;
import 'signup_form_bloc/signup_form_bloc.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioModule = _$DioModule();
  final loggerModule = _$LoggerModule();
  gh.factory<_i3.Dio>(() => dioModule.dio);
  gh.lazySingleton<_i4.IAuthRepository>(
      () => _i5.AuthRepository(get<_i3.Dio>()));
  gh.factory<_i6.Logger>(() => loggerModule.logger);
  gh.factory<_i7.SignInFormBloc>(
      () => _i7.SignInFormBloc(get<_i4.IAuthRepository>()));
  gh.factory<_i8.SignUpFormBloc>(
      () => _i8.SignUpFormBloc(get<_i4.IAuthRepository>()));
  gh.factory<_i9.AuthGuard>(() => _i9.AuthGuard(get<_i4.IAuthRepository>()));
  gh.lazySingleton<_i10.AppRouter>(
      () => _i10.AppRouter(authGuard: get<_i9.AuthGuard>()));
  return get;
}

class _$DioModule extends _i11.DioModule {}

class _$LoggerModule extends _i12.LoggerModule {}
