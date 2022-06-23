import 'package:flutter/material.dart';
import 'package:metrics_viewer/app_router.dart';
import 'package:metrics_viewer/injection.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();
    return MaterialApp.router(
      routeInformationParser: router.defaultRouteParser(),
      routerDelegate: router.delegate(),
    );
  }
}
