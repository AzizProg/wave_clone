import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String id;
  final String username;
  final String phoneNumber;
  final String balance;
   UserEntity({required this.id, required this.balance,required this.phoneNumber,required this.username});


  @override

  List<Object?> get props => [id,balance,phoneNumber,username];}