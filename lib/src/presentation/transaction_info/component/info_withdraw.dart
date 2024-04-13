import 'package:flutter/material.dart';
import 'package:wave_clone/src/core/extension/number_extension.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';
import 'package:wave_clone/src/domain/entity/transaction_entity.dart';

import '../../../core/helpers/asset_helper.dart';
import '../../../core/helpers/size_helper.dart';
import '_widget_spacer.dart';

class InfoWithdraw extends StatelessWidget {
  final TransactionEntity transaction;
  const InfoWithdraw({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RotatedBox(
              quarterTurns: 2,
              child: Image.asset(
                AssetsHelper.depositIcon,
                width: context.getWidth(40),
              )),
          spaceBetweenWidget(spacerSize: 20, context: context),
          Text(
            "-${transaction.amount.formatPrice}F",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            "Retrait",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          spaceBetweenWidget(context: context),
          Text(
            "Montant retiré",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.grey),
          ),
          Text(
            "-${transaction.amount}",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          spaceBetweenWidget(context: context),
          Text(
            "Frais",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.grey),
          ),
          Text(
            "0F",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          spaceBetweenWidget(context: context),
          Text(
            "Status",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.grey),
          ),
          Text(
            "Effectué",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          spaceBetweenWidget(context: context),
          Text(
            "Nom de l'agent",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.grey),
          ),
          Text(
            transaction.agentName,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          spaceBetweenWidget(context: context),
          Text(
            "Date et heure",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.grey),
          ),
          Text(
            transaction.date,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          spaceBetweenWidget(context: context),
          Text(
            "Nouveau solde",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.grey),
          ),
          Text(
            "${transaction.balance}F",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          spaceBetweenWidget(context: context),
          Text(
            "ID de la transaction",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.grey),
          ),
          Text(
            transaction.id,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          spaceBetweenWidget(spacerSize: 20, context: context),
          Text(
            "En partenariat avec UBA",
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
