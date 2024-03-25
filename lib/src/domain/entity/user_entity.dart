import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String id;
  final String fullName;
  final String phoneNumber;
  final String balance;
   UserEntity({required this.id, required this.balance,required this.phoneNumber,required this.fullName});


  @override

  List<Object?> get props => [id,balance,phoneNumber,fullName];}