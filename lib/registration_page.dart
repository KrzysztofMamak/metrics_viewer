import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metrics_viewer/injection/injection.dart';
import 'package:metrics_viewer/signup_form_bloc/signup_form_bloc.dart';

class RegistrationPage extends HookWidget {
  const RegistrationPage({
    Key? key,
  }) : super(key: key);

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
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                        onChanged: (val) {
                          context.read<SignupFormBloc>().add(EmailChanged(val));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
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
                        decoration: InputDecoration(
                          hintText: 'Repeat password',
                        ),
                        onChanged: (val) {
                          context
                              .read<SignupFormBloc>()
                              .add(PasswordChanged(val));
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<SignupFormBloc>().add(SignupPressed());
                        },
                        child: const Text('REGISTER'),
                      ),
                    ],
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
