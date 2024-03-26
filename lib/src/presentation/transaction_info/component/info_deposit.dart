import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wave_clone/src/domain/entity/transaction_entity.dart';

import '../../../core/helpers/asset_helper.dart';
import '../../../core/helpers/size_helper.dart';
import '../../home/component/_transaction_title_switch.dart';
import '_widget_spacer.dart';

class InfoDeposit extends StatelessWidget {
  final TransactionEntity transaction;
  const InfoDeposit({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RotatedBox(
            quarterTurns: 2,
            child: Image.asset(
              AssetsHelper.depositIcon,
              width: SizesHelper.width(40),
            )),
        spaceBetweenWidget(spacerSize: 20),
        Text(
          "${transaction.amount}F",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        transactionTitleSwitch(transaction, context),
        spaceBetweenWidget(),
        const Text("Montant reçu"),
        Text("${transaction.amount - (transaction.amount * 0.01)}")
      ],
    );
  }
}
