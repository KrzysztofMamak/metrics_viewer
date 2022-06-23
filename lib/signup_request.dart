import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';

part 'signup_request.g.dart';

@immutable
@JsonSerializable(createFactory: false)
class SignupRequest {
  const SignupRequest({
    required this.emailAddress,
    required this.password,
  });

  final String emailAddress;
  final String password;

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
