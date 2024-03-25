import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_event.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(const LoginState(pinCode: "", loginState: FormStatus.initial)) {
    on<LoginEventPinCodeChanged>(_onLoginEventPinCodeChanged);
  }

  void _onLoginEventPinCodeChanged(
      LoginEventPinCodeChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(pinCode: event.pinCode));
    if (state.pinCode.isNotEmpty) {
      emit(state.copyWith(loginState: FormStatus.loading));
      await Future.delayed(const Duration(seconds: 5));
      emit(state.copyWith(loginState: FormStatus.success));
    }
    ;
  }
}
