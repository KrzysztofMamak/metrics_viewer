import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metrics_viewer/injection/injection.dart';
import 'package:metrics_viewer/signup_form_bloc/signup_form_bloc.dart';
import 'package:metrics_viewer/util/ext/build_context_ext.dart';

class RegistrationPage extends HookWidget {
  RegistrationPage({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final repeatedPasswordController = useTextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: BlocProvider(
        create: (_) => getIt<SignupFormBloc>(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 600,
              ),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: BlocBuilder<SignupFormBloc, SignupFormState>(
                builder: (context, state) {
                  if (state.isSubmitting) {
                    return CircularProgressIndicator();
                  } else if (state.authFailureOrSuccessOption.isSome()) {
                    return Icon(Icons.clear);
                  }
                  return Form(
                    key: _formKey,
                    autovalidateMode: state.showErrorMessages
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: emailController,
                          validator: context.validator.validateEmailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                          onChanged: (val) {
                            context
                                .read<SignupFormBloc>()
                                .add(EmailChanged(val));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: context.validator.validatePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                          ),
                          onChanged: (val) {
                            context
                                .read<SignupFormBloc>()
                                .add(PasswordChanged(val));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: repeatedPasswordController,
                          validator: (value) =>
                              context.validator.validateRepeatedPassword(
                            passwordController.text,
                            value,
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Repeat password',
                          ),
                          onChanged: (val) {
                            context
                                .read<SignupFormBloc>()
                                .add(RepeatedPasswordChanged(val));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<SignupFormBloc>().add(SignupPressed());
                          },
                          child: const Text('REGISTER'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
