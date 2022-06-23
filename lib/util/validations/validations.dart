import 'package:metrics_viewer/util/validations/validation_template.dart';

abstract class Validations {
  static validateEmailAddress(String emailAddress) {
    return RegExp(ValidationTemplate.emailAddress).hasMatch(emailAddress);
  }
}
