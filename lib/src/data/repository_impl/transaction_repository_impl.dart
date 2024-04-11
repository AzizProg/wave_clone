import 'package:wave_clone/src/data/data_source/local/wave_api_simulation.dart';
import 'package:wave_clone/src/domain/entity/transaction_entity.dart';
import 'package:wave_clone/src/domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl extends TransactionRepository {
  TransactionRepositoryImpl(WaveApiSimulation waveApiSimulation)
      : _waveApi = waveApiSimulation;

  final WaveApiSimulation _waveApi;
  @override
  Future<List<TransactionEntity>> getAllTransaction() {
    return Future.delayed(
        const Duration(seconds: 3),
        () => _waveApi
            .getTransaction()
            .then((value) => value.map((e) => e.toEntity()).toList()));
  }
}
