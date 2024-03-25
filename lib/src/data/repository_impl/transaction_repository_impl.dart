import 'package:wave_clone/src/data/data_source/local/wave_api_simulation.dart';
import 'package:wave_clone/src/domain/entity/transaction_entity.dart';
import 'package:wave_clone/src/domain/repository/transaction_repository.dart';

import '../data_source/local/data_local.dart';

class TransactionRepositoryImpl extends TransactionRepository{
   TransactionRepositoryImpl(WaveApiSimulation waveApiSimulation):this._waveApi=waveApiSimulation;

  final WaveApiSimulation _waveApi;
  @override
  Future<List<TransactionEntity>> getAllTransaction() {
  return Future.delayed(const Duration(seconds: 2),()=> _waveApi.getTransaction());

  }



}