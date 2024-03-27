sealed class LoginEvent {}

class LoginEventPinCodeChanged extends LoginEvent {
  final int pinCode;
  LoginEventPinCodeChanged({required this.pinCode});
}

class LoginPinCodeCompleted extends LoginEvent{}
