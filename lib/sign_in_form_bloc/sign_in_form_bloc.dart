import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:metrics_viewer/auth_failure.dart';
import 'package:metrics_viewer/i_auth_repository.dart';
import 'package:metrics_viewer/login_request.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthRepository _authRepository;

  SignInFormBloc(this._authRepository) : super(SignInFormState.initial()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(emailAddress: event.email));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<SignInPressed>((event, emit) async {
      if (state.emailAddress.isNotEmpty && state.password.isNotEmpty) {
        emit(state.copyWith(isSubmitting: true));

        final failureOrSuccessOption = await _authRepository.signIn(
          LoginRequest(
            emailAddress: state.emailAddress,
            password: state.password,
          ),
        );

        emit(
          state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: optionOf(failureOrSuccessOption),
            showErrorMessages: true,
          ),
        );
      } else {
        emit(state.copyWith(showErrorMessages: true));
      }
    });
  }
}
