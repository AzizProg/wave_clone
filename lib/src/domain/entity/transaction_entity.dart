import 'package:equatable/equatable.dart';

import '../../core/enums/transaction_status_enums.dart';
import '../../core/enums/transaction_type.dart';

class TransactionEntity extends Equatable {
  final String id;
  final double balance;
  final double amount;
  final String senderName;
  final String senderPhoneNumber;
  final String receiverName;
  final String receiverPhoneNumber;
  final String agentName;
  final String date;
  final double fee;
  final TransactionType type;
  final TransactionStatusEnums status;

  const TransactionEntity({
    required this.id,
    required this.balance,
    required this.amount,
    required this.senderName ,
    required this.senderPhoneNumber ,
    required this.receiverName ,
    required this.receiverPhoneNumber ,
    required this.agentName,
     required this.date,
    required  this.fee,
    required this.type,
    required this.status,
  });

  @override
  List<Object?> get props => [
    id,
    balance,
    amount,
    senderName,
    senderPhoneNumber,
    receiverName,
    receiverPhoneNumber,
    date,
    fee,
    type,
    status,
  ];


}
