import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:uuid/v4.dart';
import 'package:wave_clone/src/domain/entity/transfer_entity.dart';

class TransferModel extends Equatable {
  double balanceConst = 50000;


   String? id;
  double? balance;
  final double amount;
  final String? senderName;
  final String? senderPhoneNumber;
  final String receiverName;
  final String receiverPhoneNumber;
  String? transactionId;
  final DateTime? dateTime;
  final double? fee;
  final String status;
  TransferModel(
      {

        this.balance,
      required this.amount,
      required this.senderName,
      required this.senderPhoneNumber,
      required this.receiverName,
      required this.receiverPhoneNumber,
      this.fee = 0.01, //1%
      this.dateTime,
      required this.status}) {
    id ?? const UuidV4().generate();
    dateTime ?? DateTime.now();
    transactionId ?? const UuidV4().generate();
    balance ?? balanceConst;
  }

  //get date formatted
  String getDate() {
    return DateFormat("dd MMMM yyyy", "fr").format(dateTime!);
  }

//get time formatted
  String getTime() {
    return DateFormat("HH:mm").format(dateTime!);
  }

  //change balance
  double changeBalance(double amount) {
    double feeValue = getFeeValue();
    return balanceConst = (balance! - (amount + feeValue));
  }

  // amount generate by transfer fee
  double getFeeValue() {
    return fee! * amount;
  }

  //
//parse TransferModel date to TransferEntity data
  TransferEntity toTransferEntity() {
    return TransferEntity(
        id: id!,
        balance: balance!,
        amount: amount,
        senderName: senderName!,
        senderPhoneNumber: senderPhoneNumber!,
        receiverName: receiverName,
        receiverPhoneNumber: receiverPhoneNumber,
        transactionId: transactionId!,
        fee: fee!,
        date: getDate(),
        time: getTime(),
        status: status);
  }

  @override
  List<Object?> get props => [
        id,
        balance,
        senderName,
        senderPhoneNumber,
        receiverName,
        receiverPhoneNumber,
        transactionId,
        fee,
        dateTime,
        status
      ];
}
