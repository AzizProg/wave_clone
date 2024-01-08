class LoginFormState {
  final String pinCode;
  final LoginStates loginStates;
  LoginFormState(
      {this.pinCode = '', this.loginStates = const LoginStateInitial()});
  LoginFormState copyWith({String? pinCode, LoginStates? loginStates}) {
    return LoginFormState(
        pinCode: pinCode ?? this.pinCode,
        loginStates: loginStates ?? this.loginStates);
  }
}

abstract class LoginStates {
  const LoginStates();
}

class LoginStateInitial extends LoginStates {
  const LoginStateInitial();
}

class LoginStateSubmitting extends LoginStates {}

class LoginStateSuccess extends LoginStates {}

class LoginStateFailed extends LoginStates {}
class LoginStateForgetButtonPressed extends LoginStates {}
class LoginStateForgetButtonReleased extends LoginStates {}


