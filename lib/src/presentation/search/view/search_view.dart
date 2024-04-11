import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_bloc.dart';
import 'package:wave_clone/src/presentation/search/component/invoices_list.dart';
import 'package:wave_clone/src/presentation/search/component/search_appbar.dart';
import 'package:wave_clone/src/presentation/search/component/transactions_list.dart';

import '../bloc/search_state.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: ColorsHelper.backgroundColor,
          appBar: const SearchAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: BlocBuilder<SearchBloc, SearchState>(builder: (_, state) {
              switch (state.type) {
                case TransactionType.transfers:
                  return const TransactionList();
                case TransactionType.invoices:
                  return const InvoicesList();
              }
            }),
          ),
        ));
  }
}
