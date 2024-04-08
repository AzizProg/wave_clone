import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/data/repository_impl/transaction_repository_impl.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_event.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required TransactionRepositoryImpl transactionRepositoryImpl})
      : _repositoryImpl = transactionRepositoryImpl,
        super( HomeState()) {
    on<HomeEventGetAllTransactions>(_getAllTransactions);
    on<HomeEventShowBalance>(_showBalance);
    on<HomeEventHideBalance>(_hideBalance);
  }

  final TransactionRepositoryImpl _repositoryImpl;

  Future<void> _getAllTransactions(
      HomeEventGetAllTransactions event, Emitter<HomeState> emit) async {
    emit(state.copyWith(transactionStatus: TransactionStatus.loading));
    try {
      final transactions = await _repositoryImpl.getAllTransaction();
      print(transactions.length);
     emit(state.copyWith(transactionStatus: TransactionStatus.success,transactions: transactions));
    } catch (e) {
      emit(state.copyWith(transactionStatus: TransactionStatus.failed));
    }
  }

  void _showBalance(HomeEventShowBalance event, Emitter<HomeState> emit) {
    emit(state.copyWith(balanceStatus: BalanceStatus.displayed));
  }

  void _hideBalance(HomeEventHideBalance event, Emitter<HomeState> emit) {
    emit(state.copyWith(balanceStatus: BalanceStatus.hidden));
  }
}
