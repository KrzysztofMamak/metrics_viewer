part of 'signup_form_bloc.dart';

@freezed
abstract class SignupFormState with _$SignupFormState {
  const factory SignupFormState({
    required String emailAddress,
    required String password,
    required String repeatedPassword,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignupFormState;

  factory SignupFormState.initial() => SignupFormState(
    emailAddress: '',
    password: '',
    repeatedPassword: '',
    showErrorMessages: false,
    isSubmitting: false,
    authFailureOrSuccessOption: none(),
  );
}
