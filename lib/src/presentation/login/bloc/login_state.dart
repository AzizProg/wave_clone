import 'package:equatable/equatable.dart';

enum FormStatus { initial, loading, failed, success }

class LoginState extends Equatable {
  final String pinCode;
  final FormStatus loginState;
  const LoginState({required this.pinCode, required this.loginState});

  LoginState copyWith({String? pinCode, FormStatus? loginState}) {
    return LoginState(
        pinCode: pinCode ?? this.pinCode,
        loginState: loginState ?? this.loginState);
  }

  @override
  List<Object?> get props => [pinCode, loginState];
}
