import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:metrics_viewer/auth_failure.dart';
import 'package:metrics_viewer/i_auth_repository.dart';
import 'package:metrics_viewer/login_request.dart';

part 'signup_form_event.dart';

part 'signup_form_state.dart';

part 'signup_form_bloc.freezed.dart';

@injectable
class SignUpFormBloc extends Bloc<SignupFormEvent, SignupFormState> {
  final IAuthRepository _authRepository;

  SignUpFormBloc(this._authRepository) : super(SignupFormState.initial()) {
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
      emit(
        state.copyWith(
          showErrorMessages: true,
        ),
      );

      if (state.password == state.repeatedPassword
          // && email.isValid TODO
          ) {
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
      }
    });
  }
}
