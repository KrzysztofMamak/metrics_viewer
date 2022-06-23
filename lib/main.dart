import 'package:flutter/material.dart';
import 'package:metrics_viewer/app.dart';
import 'package:metrics_viewer/app_config_manager.dart';
import 'package:metrics_viewer/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfigManager.configure();
  configureInjection();
  runApp(const App());
}
