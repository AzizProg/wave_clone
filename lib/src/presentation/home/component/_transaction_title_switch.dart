import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/enums/transaction_type.dart';
import '../../../core/helpers/color_helper.dart';
import '../../../domain/entity/transaction_entity.dart';

///manage [transaction] title
Widget transactionTitleSwitch(
    TransactionEntity transaction, BuildContext context) {
  String title = "";
  switch (transaction.type) {
    case TransactionType.deposit:
      title = "De ${transaction.senderName} ${transaction.senderPhoneNumber}";

    case TransactionType.transfer:
      title =
          "A ${transaction.receiverName} ${transaction.receiverPhoneNumber}";
    case TransactionType.withdraw:
      title = "Retrait";
  }

  return Text(
    title,
    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: ColorsHelper.primaryColor(), fontWeight: FontWeight.bold),
  );
}
