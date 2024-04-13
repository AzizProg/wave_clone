
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_event.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_state.dart';
import 'package:wave_clone/src/presentation/login/view/login_form.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late StringBuffer _buffer;
  LoginBloc({StringBuffer? buffer})
      : _buffer = buffer ?? StringBuffer(''),
        super(LoginState()) {
    on<LoginEventPinCodeChanged>(_onLoginEventPinCodeChanged);
    on<LoginPinCodeCompleted>(_onLoginEventPinCodeCompleted);
  }

  ///[StringBuffer] is better if we can to iterate String modification


  ///verify if pinCode received is inferior to zero ,
  ///verify if [_buffer] is not empty  and emit the [_buffer] as [LoginState] to [LoginView] screen.

  void _onLoginEventPinCodeChanged(
      LoginEventPinCodeChanged event, Emitter<LoginState> emit) {
    if (event.pinCode.isNegative) {
      if (_buffer.isNotEmpty) {
        _buffer =
            StringBuffer(_buffer.toString().substring(0, _buffer.length - 1));
        emit(state.copyWith(pinCode: _buffer.toString()));
      }
    } else {
      _buffer.write(event.pinCode);
      emit(state.copyWith(pinCode: _buffer.toString()));
      if (_buffer.length == 4) {
        add(LoginPinCodeCompleted());
      }
    }
  }

  void _onLoginEventPinCodeCompleted(
      LoginPinCodeCompleted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(formStatus: FormStatus.success));
  }

  @override
  Future<void> close() {
    _buffer.clear();
    return super.close();
  }
}
