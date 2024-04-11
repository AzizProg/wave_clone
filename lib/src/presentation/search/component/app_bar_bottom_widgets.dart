import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_bloc.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_event.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_state.dart';
import 'package:wave_clone/src/presentation/search/component/_custom_switch_button.dart';
import 'package:wave_clone/src/presentation/search/component/transaction_search_bar.dart';

class AppBarBottomWidgets extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarBottomWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TransactionSearchBar(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                CustomSwitchButton(
                  title: "Transfers",
                  icon: FontAwesomeIcons.solidUser,
                  onTap: () {
                    context.read<SearchBloc>().add(GetTransfers());
                  },
                  type: TransactionType.transfers,
                ),
                SizedBox(
                  width: context.getWidth(10),
                ),
                CustomSwitchButton(
                  title: "Factures",
                  icon: FontAwesomeIcons.solidLightbulb,
                  onTap: () {
                    context.read<SearchBloc>().add(GetInvoices());
                  },
                  type: TransactionType.invoices,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
