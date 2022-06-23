import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:metrics_viewer/app_router.dart';
import 'package:metrics_viewer/i_auth_repository.dart';

@injectable
class AuthGuard extends AutoRouteGuard {
  AuthGuard(this._authRepository);

  final IAuthRepository _authRepository;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    _authRepository.auth().then((failureOrUnit) {
      failureOrUnit.fold(
        (l) => router.push(LoginRoute()),
        (r) => resolver.next(),
      );
    });
  }
}
