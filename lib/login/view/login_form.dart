import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login/login/login.dart';
import 'package:flutter_firebase_login/sign_up/sign_up.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWideScreen = constraints.maxWidth > 600;
          return Center(
            child: AspectRatio(
              aspectRatio: isWideScreen ? 9 / 16 : 2 / 3,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colorScheme.secondary,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: BlocListener<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state.status.isFailure) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text(
                                state.errorMessage ?? 'Authentication Failure'),
                          ),
                        );
                    }
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/imageninicio.jpg',
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Bienvenido',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 171, 45, 176),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _EmailInput(),
                        const SizedBox(height: 8),
                        _PasswordInput(),
                        const SizedBox(height: 8),
                        _LoginButton(),
                        const SizedBox(height: 8),
                        _GoogleLoginButton(),
                        const SizedBox(height: 4),
                        _SignUpButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginCubit cubit) => cubit.state.email.displayError,
    );

    return TextField(
      key: const Key('loginForm_emailInput_textField'),
      onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Correo electrónico',
        helperText: '',
        errorText: displayError != null ? 'correo electrónico no válido' : null,
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginCubit cubit) => cubit.state.password.displayError,
    );

    return TextField(
      key: const Key('loginForm_passwordInput_textField'),
      onChanged: (password) =>
          context.read<LoginCubit>().passwordChanged(password),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        helperText: '',
        errorText: displayError != null ? 'contraseña no válida' : null,
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (LoginCubit cubit) => cubit.state.status.isInProgress,
    );

    if (isInProgress) return const CircularProgressIndicator();

    final isValid = context.select(
      (LoginCubit cubit) => cubit.state.isValid,
    );

    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      key: const Key('loginForm_continue_raisedButton'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: isValid ? colorScheme.secondary : colorScheme.primary,
        foregroundColor: isValid ? colorScheme.surface : Colors.white,
      ),
      onPressed: isValid
          ? () => context.read<LoginCubit>().logInWithCredentials()
          : null,
      child: const Text('INICIO'),
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton.icon(
      key: const Key('loginForm_googleLogin_raisedButton'),
      label: const Text(
        'INICIO DE SESION CON GOOGLE',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: colorScheme.secondary,
      ),
      icon: const Icon(FontAwesomeIcons.google, color: Colors.white),
      onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ElevatedButton.icon(
      key: const Key('loginForm_createAccount_raisedButton'),
      icon: const Icon(Icons.person_add, color: Colors.white),
      label: const Text(
        'CREAR UNA CUENTA',
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: colorScheme.secondary,
      ),
      onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
    );
  }
}
