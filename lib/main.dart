import 'package:bloctest/auth/form_submission_status.dart';
import 'package:bloctest/auth/login_bloc.dart';
import 'package:bloctest/auth/login_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/auth_repo.dart';
import 'auth/login_state.dart';

void main() {
  runApp(block());
}

class block extends StatelessWidget {
  // const block({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: RepositoryProvider(
      create: (context) => AuthRepository(),
      child: Scaffold(
        body: formz(formKey),
      ),
    ));
  }
}

Widget formz(formKey) {
  return BlocProvider(
    create: (context) =>
        LoginBloc(authRepository: context.read<AuthRepository>()),
    child: Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(80, 40, 80, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [login(), password(), buttonClick(formKey)],
          ),
        ),
      ),
    ),
  );
}

Widget login() {
  return BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      return TextFormField(
          onChanged: (value) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(value)),
          validator: (value) => state.IsvalidU ? null : 'too short',
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
            hintText: "username",
          ));
    },
  );
}

Widget password() {
  return BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      return TextFormField(
          onChanged: (value) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(value)),
          validator: (value) => state.IsvalidU ? null : 'too short',
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.security),
            hintText: "password",
          ));
    },
  );
}

Widget buttonClick(formKey) {
  return BlocBuilder<LoginBloc, LoginState>(
    builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 3, shadowColor: Colors.black45),
              onPressed: () {
                if (formKey.currentState.validate()) {
                  context.read<LoginBloc>().add(LoginSubmit());
                }
              },
              child: Text(
                "login",
                style: TextStyle(letterSpacing: 2),
              ));
    },
  );
}
