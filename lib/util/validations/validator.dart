import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:metrics_viewer/util/validations/validations.dart';

class Validator {
  Validator._(this._loc);

  static Validator? _instance;

  AppLocalizations _loc;

  static get(AppLocalizations loc) =>
      _instance ??= _instance?._loc.localeName == loc.localeName
          ? _instance
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
}
