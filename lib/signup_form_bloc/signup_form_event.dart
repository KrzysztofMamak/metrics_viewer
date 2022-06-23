part of 'signup_form_bloc.dart';

@freezed
abstract class SignupFormEvent with _$SignupFormEvent {
  const factory SignupFormEvent.emailChanged(String email) = EmailChanged;

  const factory SignupFormEvent.passwordChanged(String password) =
      PasswordChanged;

  const factory SignupFormEvent.repeatedPasswordChanged(
      String repeatedPassword) = RepeatedPasswordChanged;

  const factory SignupFormEvent.signIndPressed() = SignupPressed;
}
