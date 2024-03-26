import 'package:flutter/cupertino.dart';
import 'package:wave_clone/src/core/enums/transaction_type.dart';
import 'package:wave_clone/src/domain/entity/transaction_entity.dart';
import 'package:wave_clone/src/presentation/transaction_info/component/info_deposit.dart';
import 'package:wave_clone/src/presentation/transaction_info/component/info_transfer.dart';
import 'package:wave_clone/src/presentation/transaction_info/component/info_withdraw.dart';

Widget viewSwitcher(TransactionEntity transaction){
  switch(transaction.type){
    case TransactionType.deposit:
     return InfoDeposit(transaction: transaction);
    case TransactionType.transfer:
      return InfoTransfer(transaction: transaction);
    case TransactionType.withdraw:
      return InfoWithdraw(transaction: transaction);
  }

}