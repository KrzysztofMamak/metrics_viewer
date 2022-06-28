import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:metrics_viewer/util/validations/validations.dart';

class Validator {
  Validator._(this._loc);

  static Validator? _instance;

  final AppLocalizations _loc;

  static Validator get(AppLocalizations loc) =>
      _instance ??= _instance?._loc.localeName == loc.localeName
          ? _instance!
          : Validator._(loc);

  String? validateEmailAddress(String? emailAddress) {
    if (emailAddress == null || emailAddress.isEmpty) {
      return _loc.inputErrorEmpty;
    } else if (Validations.validateEmailAddress(emailAddress)) {
      return null;
    } else {
      return _loc.inputErrorInvalidEmailAddress;
    }
  }

  String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return _loc.inputErrorEmpty;
    }
    return null;
  }

  String? validatePassword(
    String? value, {
    int minLength = 8,
  }) {
    if (value == null || value.isEmpty) {
      return _loc.inputErrorEmpty;
    }
    if (value.length < 8) {
      return _loc.inputErrorEmptyWeakPassword(minLength);
    }
    return null;
  }

  String? validateRepeatedPassword(String? password, String? repeatedPassword) {
    if (repeatedPassword == null || repeatedPassword.isEmpty) {
      return _loc.inputErrorEmpty;
    }
    if (repeatedPassword != password) {
      return _loc.inputErrorPasswordsMismatch;
    }
    return null;
  }
}
