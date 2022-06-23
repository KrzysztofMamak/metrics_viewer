import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:metrics_viewer/util/validations/validator.dart';

extension BuildContextExt on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;

  Validator get validator => Validator.get(loc);
}
