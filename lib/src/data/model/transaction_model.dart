import 'package:wave_clone/src/domain/entity/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  const TransactionModel(
      {required super.id,
      required super.balance,
      required super.amount,
      required super.senderName,
      super.senderPhoneNumber = "",
      super.receiverName = "",
      super.receiverPhoneNumber = "",
      super.agentName = "",
      required super.date,
      required super.fee,
      required super.type,
      required super.status});

  TransactionEntity toEntity() {
    return TransactionEntity(
        id: id,
        balance: balance,
        amount: amount,
        senderName: senderName,
        senderPhoneNumber: senderPhoneNumber,
        receiverName: receiverName,
        receiverPhoneNumber: receiverPhoneNumber,
        agentName: agentName,
        date: date,
        fee: fee,
        type: type,
        status: status);
  }
}
