import 'dart:math';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_event.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(const LoginState(pinCode: "", loginState: FormStatus.initial)) {
    on<LoginEventPinCodeChanged>(_onLoginEventPinCodeChanged);
  }

  String pinCode = '';

  void _onLoginEventPinCodeChanged(
      LoginEventPinCodeChanged event, Emitter<LoginState> emit) async {
    pinCode += event.pinCode;
    print(pinCode);
    if (state.pinCode.length < 4) {

      emit(state.copyWith(pinCode: event.pinCode));
    } else {
emit(state.copyWith(loginState: FormStatus.loading));
      await Future.delayed(const Duration(seconds: 5));
      emit(state.copyWith(loginState: FormStatus.success));
    }
  }
}
