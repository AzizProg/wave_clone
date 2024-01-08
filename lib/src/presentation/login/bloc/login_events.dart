 class LoginEvent {}

class LoginEventPinCodeChanged extends LoginEvent {
  final String? pinCode;
  LoginEventPinCodeChanged({ this.pinCode});
}
 class LoginEventForgetButtonPressed extends LoginEvent {

 }

 class LoginEventForgetButtonReleased extends LoginEvent {

 }