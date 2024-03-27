import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/domain/entity/transaction_entity.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_state.dart';

import '../../../core/constants/route_names.dart';
import '../bloc/home_bloc.dart';
import '_transaction_tile.dart';

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
                cacheExtent: state.transactions?.length.toDouble(),
                prototypeItem: const ListTile(),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.transactions?.length,
                itemBuilder: (_, index) {
                  TransactionEntity transaction = state.transactions![index];
                  return InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                          RoutesNames.transationInfo,
                          arguments: transaction),
                      child: transactionTile(transaction, context));
                });
          }
      }
    });
  }
}
