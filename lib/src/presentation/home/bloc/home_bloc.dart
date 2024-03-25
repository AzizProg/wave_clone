import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/data/repository_impl/transaction_repository_impl.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_event.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required TransactionRepositoryImpl transactionRepositoryImpl})
      : _repositoryImpl = transactionRepositoryImpl,
        super(HomeStateInitial()) {

    on<HomeEventGetAllTransactions>(_getAllTransactions);
  }

  TransactionRepositoryImpl _repositoryImpl;

  Future<void> _getAllTransactions(HomeEventGetAllTransactions event,Emitter<HomeState> emit) async{
    emit(HomeStateLoading());
    try{
      await _repositoryImpl.getAllTransaction();
    } catch(e){
      emit(HomeStateFailed());
    }
  }
}
