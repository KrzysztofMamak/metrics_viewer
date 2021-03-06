import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:metrics_viewer/auth_failure.dart';
import 'package:metrics_viewer/i_auth_repository.dart';
import 'package:metrics_viewer/login_request.dart';
import 'package:metrics_viewer/util/validations/validations.dart';

part 'signup_form_event.dart';

part 'signup_form_state.dart';

part 'signup_form_bloc.freezed.dart';

@injectable
class SignupFormBloc extends Bloc<SignupFormEvent, SignupFormState> {
  final IAuthRepository _authRepository;

  SignupFormBloc(this._authRepository) : super(SignupFormState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(emailAddress: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<RepeatedPasswordChanged>((event, emit) {
      emit(state.copyWith(repeatedPassword: event.repeatedPassword));
    });

    on<SignupPressed>((event, emit) async {
      if (state.password == state.repeatedPassword &&
          Validations.validateEmailAddress(state.emailAddress)) {
        emit(state.copyWith(isSubmitting: true));

        final signupResult = await _authRepository.signIn(
          LoginRequest(
            emailAddress: state.emailAddress,
            password: state.password,
          ),
        );

        emit(
          state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: optionOf(signupResult),
          ),
        );
      } else {
        emit(
          state.copyWith(
            showErrorMessages: true,
          ),
        );
      }
    });
  }
}
