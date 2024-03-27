
import 'package:flutter/material.dart';

import '../../../core/enums/transaction_type.dart';
import '../../../core/helpers/color_helper.dart';
import '../../../domain/entity/transaction_entity.dart';

///manage [transaction] amount on the right of screen
Widget transactionAmountSwitch(
    TransactionEntity transaction, BuildContext context) {
  String amount = "";
  switch (transaction.type) {
    case TransactionType.deposit:
      amount = " ${transaction.amount}F";

    case TransactionType.transfer:
      amount = "-${transaction.amount}";
    case TransactionType.withdraw:
      amount = "-${transaction.amount}";
  }
  return Text(
    amount,
    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: ColorsHelper.primaryColor(), fontWeight: FontWeight.bold),
  );
}