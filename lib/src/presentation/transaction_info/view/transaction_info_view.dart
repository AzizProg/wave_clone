import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wave_clone/src/presentation/transaction_info/component/_view_switcher.dart';

import '../../../domain/entity/transaction_entity.dart';

class TransactionInfoView extends StatelessWidget {
  final TransactionEntity transaction;
  const TransactionInfoView({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          title: Text(
            "Reçu",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(child: viewSwitcher(transaction)),
          ),
        ));
  }
}
