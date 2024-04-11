import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_state.dart';

import '../../../core/constants/route_names.dart';
import '../../../domain/entity/transaction_entity.dart';
import '../../home/component/transaction_tile.dart';
import '../bloc/search_bloc.dart';
import 'not_found.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (_, state) {
      switch (state.status) {
        case SearchPageStatus.loading:
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        case SearchPageStatus.success:
         return  SingleChildScrollView(
            physics:state.transfers!.isNotEmpty? const BouncingScrollPhysics():null,
            child: state.transfers!.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: ListView.builder(

                        prototypeItem: const ListTile(),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.transfers?.length,
                        itemBuilder: (_, index) {
                          TransactionEntity transaction =
                              state.transfers![index];
                          return InkWell(
                              onTap: () => Navigator.of(context).pushNamed(
                                  RoutesNames.transationInfo,
                                  arguments: transaction),
                              child: TransactionTile(
                                transaction: transaction,
                              ));
                        }),
                  )
                : const NotFound(),
          );

        default:
          return const NotFound();
      }
    });
  }
}
