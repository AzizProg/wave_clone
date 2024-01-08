import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_events.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_states.dart';

class LoginBloc extends Bloc<LoginEvent,LoginFormState>{
  LoginBloc():super(LoginFormState()){
    on<LoginEventPinCodeChanged>(_onLoginEventPinCodeChanged);
    on<LoginEventForgetButtonPressed>(_onLoginEventForgetButtonPressed);
    on<LoginEventForgetButtonReleased>(_onLoginEventForgetButtonReleased);
  }

  _onLoginEventPinCodeChanged(LoginEventPinCodeChanged event,Emitter<LoginFormState> emit){
    emit(state.copyWith(pinCode:event.pinCode));
  }
  _onLoginEventForgetButtonPressed(LoginEventForgetButtonPressed event,Emitter<LoginFormState> emit){
emit (state.copyWith(loginStates: LoginStateForgetButtonPressed()));
  }
  _onLoginEventForgetButtonReleased(LoginEventForgetButtonReleased event,Emitter<LoginFormState> emit){
    emit (state.copyWith(loginStates: LoginStateForgetButtonReleased()));
  }
}