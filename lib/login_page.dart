import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:metrics_viewer/app_router.dart';
import 'package:metrics_viewer/injection/injection.dart';
import 'package:metrics_viewer/sign_in_form_bloc/sign_in_form_bloc.dart';
import 'package:metrics_viewer/util/ext/build_context_ext.dart';

class LoginPage extends HookWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

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
              constraints: const BoxConstraints(
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
                    return const CircularProgressIndicator();
                  } else if (state.authFailureOrSuccessOption.isSome()) {
                    return const Icon(Icons.clear);
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
                          decoration: const InputDecoration(
                            hintText: 'Email',
                          ),
                          onChanged: (val) {
                            context
                                .read<SignInFormBloc>()
                                .add(EmailChanged(val));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: passwordController,
                          validator: context.validator.validateNotEmpty,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                          ),
                          onChanged: (val) {
                            context
                                .read<SignInFormBloc>()
                                .add(PasswordChanged(val));
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
                            context
                                .read<SignInFormBloc>()
                                .add(const SignInPressed());
                          },
                          child: const Text('LOGIN'),
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
