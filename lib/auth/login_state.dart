import 'package:bloctest/auth/form_submission_status.dart';

class LoginState {
  final String username;
  bool get IsvalidU => username.length > 3;
  final String password;
  bool get IsvalidP => username.length > 6;

  final FormSubmitStatus formStatus;

  LoginState(
      {this.username = "",
      this.password = '',
      this.formStatus = const InitialFormStatus()});

  LoginState copyWith({
    String? username,
    String? password,
    FormSubmitStatus? formStatus,
  }) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }
}
