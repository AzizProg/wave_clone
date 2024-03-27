import 'package:flutter/material.dart';
import 'package:wave_clone/src/domain/entity/transaction_entity.dart';

import 'package:wave_clone/src/presentation/transaction_info/view/transaction_info_view.dart';


class TransactionInfoPage extends StatelessWidget {
  final TransactionEntity transaction;
  const TransactionInfoPage({super.key, required this.transaction});


  @override
  Widget build(BuildContext context) {
    return  TransactionInfoView(transaction: transaction,);
  }
}
