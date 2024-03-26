import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/core/enums/transaction_type.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';
import 'package:wave_clone/src/domain/entity/transaction_entity.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_state.dart';

import '../bloc/home_bloc.dart';

class TransactionSection extends StatelessWidget {
  const TransactionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (_, state) {
      switch (state.transactionStatus) {
        case TransactionStatus.initial:
          return const Center(
            child: Text("Aucune transaction pour le moment"),
          );
        case TransactionStatus.loading:
          return const Center(child: CircularProgressIndicator());
        case TransactionStatus.failed:
          return const Text("Failed");
        case TransactionStatus.success:
          if (state.transactions!.isEmpty) {
            return const Center(
              child: Text("Pas encore de transaction"),
            );
          } else {
            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.transactions?.length,
                itemBuilder: (_, index) {
                  TransactionEntity transaction = state.transactions![index];
                  return _transactionTile(transaction,context);
                });
          }
      }
    });

  }

  Widget _transactionTile(TransactionEntity transaction , BuildContext context) {
    final tile = ListTile(
      title: _transactionTitleSwitch(transaction,context),
      subtitle: Text(transaction.date,style: const TextStyle(
        fontWeight: FontWeight.bold
      ),),
      trailing: _transactionAmountSwitch(transaction,context),
    );
    return tile;
  }

  ///manage [transaction] title
  Widget _transactionTitleSwitch(TransactionEntity transaction,BuildContext context) {
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

    return Text(title,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorsHelper.primaryColor(),fontWeight: FontWeight.bold),);
  }
  ///manage [transaction] amount on the right of screen
  Widget _transactionAmountSwitch(TransactionEntity transaction,BuildContext context) {
    String amount = "";
    switch (transaction.type) {
      case TransactionType.deposit:
        amount = " ${transaction.amount}F";

      case TransactionType.transfer:
        amount = "-${transaction.amount}";
      case TransactionType.withdraw:
        amount = "-${transaction.amount}";
    }
    return Text(amount,style:  Theme.of(context).textTheme.bodyMedium?.copyWith(color: ColorsHelper.primaryColor(),fontWeight: FontWeight.bold),);
  }
}
