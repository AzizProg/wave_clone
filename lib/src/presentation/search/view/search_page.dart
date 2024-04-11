import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/data/data_source/local/wave_api_simulation.dart';
import 'package:wave_clone/src/data/repository_impl/transaction_repository_impl.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_event.dart';
import 'package:wave_clone/src/presentation/search/view/search_view.dart';

import '../bloc/search_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => SearchBloc(
            transaction: TransactionRepositoryImpl(WaveApiSimulation()))
          ..add(GetTransfers()),
        child: const SearchView());
  }
}
