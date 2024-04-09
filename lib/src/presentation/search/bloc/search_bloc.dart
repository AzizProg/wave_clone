import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/data/repository_impl/transaction_repository_impl.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_event.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required TransactionRepositoryImpl transaction})
      : _transactions = transaction,
        super(const SearchState()) {
    on<GetTransfers>(_getTransfers);
    on<GetInvoices>(_getInvoices);
    on<GetTransferByName>(_getTransferByName);
  }

  late final TransactionRepositoryImpl _transactions;

  void _getTransfers(GetTransfers event, Emitter<SearchState> emit) async {
    emit(state.copyWith(status: SearchPageStatus.loading));
    try {
      final transfers = await _transactions.getAllTransaction();
      emit(state.copyWith(
          transfers: transfers, status: SearchPageStatus.success));
    } catch (e) {}
  }

  void _getInvoices(GetInvoices event, Emitter<SearchState> emit) {}
  void _getTransferByName(
      GetTransferByName event, Emitter<SearchState> emit) async {
    try {
      var transfers = await _transactions.getAllTransaction();

      emit(state.copyWith(status: SearchPageStatus.loading));
      var transfersByName = transfers
          .where((element) => (element.senderName
                  .toLowerCase()
                  .contains(event.name.toLowerCase()) ||
              element.receiverName.contains(event.name.toLowerCase())))
          .toList();
      print(transfersByName.length);

      emit(state.copyWith(
          transfers: transfersByName, status: SearchPageStatus.success));
    } catch (e) {}
  }
}
