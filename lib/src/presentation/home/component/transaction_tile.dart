import 'package:flutter/material.dart';
import 'package:wave_clone/src/presentation/home/component/_transaction_amount_switch.dart';

import '../../../core/constants/route_names.dart';
import '../../../domain/entity/transaction_entity.dart';
import '_transaction_title_switch.dart';

class TransactionTile extends StatelessWidget {
   TransactionTile({super.key, required this.transaction});
  final TransactionEntity transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(

      title: transactionTitleSwitch(transaction, context),
      subtitle: Text(
        transaction.date,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: transactionAmountSwitch(transaction, context),
    );
  }
}
