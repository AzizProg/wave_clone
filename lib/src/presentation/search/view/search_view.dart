import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_event.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_state.dart';
import 'package:wave_clone/src/presentation/search/component/not_found.dart';
import 'package:wave_clone/src/presentation/search/component/search_appbar.dart';
import 'package:wave_clone/src/presentation/search/component/transaction_search_bar.dart';
import 'package:wave_clone/src/presentation/search/component/transactions_list.dart';

import '../bloc/search_bloc.dart';

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
            child: Column(
              children: [
                const TransactionSearchBar(),
                Row(
                  children: [
                    _eventButton(
                        icon: FontAwesomeIcons.solidUser,
                        title: "Transferts",
                        context: context,
                        onTap: () =>
                            context.read<SearchBloc>().add(GetTransfers())),
                    SizedBox(
                      width: context.getWidth(10),
                    ),
                    _eventButton(
                        icon: FontAwesomeIcons.solidLightbulb,
                        title: "Transferts",
                        context: context,
                        onTap: () =>
                            context.read<SearchBloc>().add(GetInvoices())),
                  ],
                ),
                BlocBuilder<SearchBloc, SearchState>(builder: (_, state) {
                  switch (state.status) {
                    case SearchPageStatus.loading:
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    case SearchPageStatus.success:
                      if (state.transfers!.isNotEmpty) {
                        return const Expanded(
                            child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: TransactionList(),
                        ));
                      } else {
                        return const NotFound();
                      }

                    default:
                      return const NotFound();
                  }
                }),
              ],
            )),
      ),
    );
  }

  Widget _eventButton(
      {required IconData icon,
      required String title,
      required Function() onTap,
      required BuildContext context}) {
    return InkWell(
      onTap: onTap,
      overlayColor:
          MaterialStateColor.resolveWith((states) => Colors.transparent),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.4),
            borderRadius: BorderRadius.circular(25)),
        child: Center(
          child: Row(
            children: [
              FaIcon(
                icon,
                size: context.getWidth((20)),
              ),
              SizedBox(
                width: context.getWidth(5),
              ),
              Text(title)
            ],
          ),
        ),
      ),
    );
  }
}
