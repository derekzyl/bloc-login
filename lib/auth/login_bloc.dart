import 'package:bloctest/auth/form_submission_status.dart';
import 'package:bloctest/auth/login_event.dart';
import 'package:bloctest/auth/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc({required this.authRepository}) : super(LoginState()) {
    on<LoginUsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });

    on<LoginPasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmit>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      Future.delayed(Duration(seconds: 10));
      try {
        await authRepository.login();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e)));
      }
    });
  }
}
