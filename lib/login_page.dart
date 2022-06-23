import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metrics_viewer/app_router.dart';
import 'package:metrics_viewer/injection.dart';
import 'package:metrics_viewer/sign_in_form_bloc/sign_in_form_bloc.dart';

class LoginPage extends HookWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: BlocProvider(
        create: (_) => getIt<SignInFormBloc>(),
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
              child: BlocBuilder<SignInFormBloc, SignInFormState>(
                builder: (context, state) {
                  if (state.isSubmitting) {
                    return CircularProgressIndicator();
                  } else if (state.authFailureOrSuccessOption.isSome()) {
                    return Icon(Icons.clear);
                  }
                  return Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                        onChanged: (val) {
                          context.read<SignInFormBloc>().add(EmailChanged(val));
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
                          context.read<SignInFormBloc>().add(PasswordChanged(val));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          getIt.get<AppRouter>().pushNamed('/registration');
                        },
                        child: const Text('CREATE ACCOUNT'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<SignInFormBloc>().add(SignInPressed());
                        },
                        child: const Text('LOGIN'),
                      ),
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}
