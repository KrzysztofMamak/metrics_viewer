import 'package:auto_route/auto_route.dart';
import 'package:metrics_viewer/home_page.dart';
import 'package:flutter/material.dart';
import 'package:metrics_viewer/login_page.dart';
import 'package:metrics_viewer/registration_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
    ),
    AutoRoute(
      path: '/login',
      page: LoginPage,
    ),
    AutoRoute(
      path: '/registration',
      page: RegistrationPage,
    ),
  ],
)
class AppRouter extends _$AppRouter{}