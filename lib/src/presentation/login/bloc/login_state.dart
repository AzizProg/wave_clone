import 'package:equatable/equatable.dart';

enum FormStatus { initial, loading, failed, success }

class LoginState extends Equatable {
  String pinCode;
  final FormStatus formStatus;
  LoginState({this.pinCode = "", this.formStatus = FormStatus.initial});

  LoginState copyWith({String? pinCode, FormStatus? formStatus}) {
    return LoginState(
        pinCode: pinCode ?? this.pinCode,
        formStatus: formStatus ?? this.formStatus);
  }

  @override
  List<Object?> get props => [pinCode, formStatus];
}
