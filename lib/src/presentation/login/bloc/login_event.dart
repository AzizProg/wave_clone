sealed class LoginEvent {}

class LoginEventPinCodeChanged extends LoginEvent {
  final String pinCode;
  LoginEventPinCodeChanged({required this.pinCode});
}

class LoginPinCodeCompleted extends LoginEvent{}
