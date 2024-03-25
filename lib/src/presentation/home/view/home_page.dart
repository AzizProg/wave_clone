import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/data/data_source/local/wave_api_simulation.dart';
import 'package:wave_clone/src/data/repository_impl/transaction_repository_impl.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_bloc.dart';

import 'package:wave_clone/src/presentation/home/view/home_view.dart';

import '../bloc/home_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static MaterialPageRoute route() {
    return MaterialPageRoute(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => TransactionRepositoryImpl(WaveApiSimulation()),
      child: BlocProvider(
        lazy: false,
        create: (_) => HomeBloc(
            transactionRepositoryImpl:
            TransactionRepositoryImpl(WaveApiSimulation()))
          ..add(HomeEventGetAllTransactions()),
        child: const HomeView(),
      ),
    );
  }
}
