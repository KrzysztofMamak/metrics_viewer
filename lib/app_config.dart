import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppConfig {
  const AppConfig({
    required this.baseUrl,
  });

  final String baseUrl;

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig(
      baseUrl: json['baseUrl'],
    );
  }
}
