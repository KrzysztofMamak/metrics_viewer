import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable(createFactory: false)
@immutable
class LoginRequest {
  const LoginRequest({
    required this.emailAddress,
    required this.password,
  });

  final String emailAddress;
  final String password;

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
