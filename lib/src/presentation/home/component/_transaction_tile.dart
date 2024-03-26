import 'package:flutter/material.dart';
import 'package:wave_clone/src/presentation/home/component/_transaction_amount_switch.dart';

import '../../../domain/entity/transaction_entity.dart';
import '_transaction_title_switch.dart';

Widget transactionTile(TransactionEntity transaction, BuildContext context) {
  final tile = ListTile(
    title: transactionTitleSwitch(transaction, context),
    subtitle: Text(
      transaction.date,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    trailing: transactionAmountSwitch(transaction, context),
  );
  return tile;
}