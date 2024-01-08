import 'package:equatable/equatable.dart';

class TransferEntity extends Equatable {
  final String id;
  final double balance;
  final double amount;
  final String senderName;
  final String senderPhoneNumber;
  final String receiverName;
  final String receiverPhoneNumber;
  final String transactionId;
  final String date;
  final String time;
  final double fee;
  final String status;
  const TransferEntity(
      {required this.id,
      required this.balance,
      required this.amount,
      required this.senderName,
      required this.senderPhoneNumber,
      required this.receiverName,
      required this.receiverPhoneNumber,
      required this.transactionId,
      required this.fee,
      required this.date,
      required this.time,
      required this.status});

  @override
  List<Object?> get props => [
        id,
        balance,
        amount,
        senderName,
        senderPhoneNumber,
        receiverName,
        receiverPhoneNumber,
        transactionId,
        fee,
        date,
        time,
        status
      ];
}
