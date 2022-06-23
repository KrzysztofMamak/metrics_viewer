// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../app_router.dart' as _i11;
import '../auth_guard.dart' as _i10;
import '../auth_repository.dart' as _i5;
import 'module/dio_module.dart' as _i12;
import '../i_auth_repository.dart' as _i4;
import 'module/logger_module.dart' as _i13;
import 'module/shared_preferenses_module.dart' as _i14;
import '../sign_in_form_bloc/sign_in_form_bloc.dart' as _i8;
import '../signup_form_bloc/signup_form_bloc.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final dioModule = _$DioModule();
  final loggerModule = _$LoggerModule();
  final sharedPreferencesModule = _$SharedPreferencesModule();
  gh.factory<_i3.Dio>(() => dioModule.dio);
  gh.lazySingleton<_i4.IAuthRepository>(
      () => _i5.AuthRepository(get<_i3.Dio>()));
  gh.factory<_i6.Logger>(() => loggerModule.logger);
  await gh.factoryAsync<_i7.SharedPreferences>(
      () => sharedPreferencesModule.prefs,
      preResolve: true);
  gh.factory<_i8.SignInFormBloc>(
      () => _i8.SignInFormBloc(get<_i4.IAuthRepository>()));
  gh.factory<_i9.SignupFormBloc>(
      () => _i9.SignupFormBloc(get<_i4.IAuthRepository>()));
  gh.factory<_i10.AuthGuard>(() => _i10.AuthGuard(get<_i4.IAuthRepository>()));
  gh.lazySingleton<_i11.AppRouter>(
      () => _i11.AppRouter(authGuard: get<_i10.AuthGuard>()));
  return get;
}

class _$DioModule extends _i12.DioModule {}

class _$LoggerModule extends _i13.LoggerModule {}

class _$SharedPreferencesModule extends _i14.SharedPreferencesModule {}
