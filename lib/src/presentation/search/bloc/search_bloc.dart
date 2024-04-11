import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/data/repository_impl/transaction_repository_impl.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_event.dart';
import 'package:wave_clone/src/presentation/search/bloc/search_state.dart';

import '../../../domain/entity/transaction_entity.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required TransactionRepositoryImpl transaction})
      : _transactions = transaction,
        super(const SearchState()) {
    on<GetTransfers>(_getTransfers);
    on<GetInvoices>(_getInvoices);
    on<GetTransferByName>(_getTransferByName);
  }

  late final TransactionRepositoryImpl _transactions;
  static List<TransactionEntity> _transfers = [];

  void _getTransfers(GetTransfers event, Emitter<SearchState> emit) async {
    if (state.status == SearchPageStatus.success &&
        state.transfers!.isNotEmpty) {
      emit(state.copyWith(
        status: SearchPageStatus.success,
        type: TransactionType.transfers,
        transfers: _transfers,
      ));
    } else {
      emit(state.copyWith(
          status: SearchPageStatus.loading, type: TransactionType.transfers));

      try {
        _transfers = await _transactions.getAllTransaction();

        emit(state.copyWith(
            transfers: _transfers,
            status: SearchPageStatus.success,
            type: TransactionType.transfers));
      } catch (e) {}
    }
  }

  void _getTransferByName(
      GetTransferByName event, Emitter<SearchState> emit) async {
    try {
      if (event.name.isEmpty) {
        emit(state.copyWith(
            transfers: _transfers, status: SearchPageStatus.success));
      } else {
        emit(state.copyWith(status: SearchPageStatus.loading));
        var transfersByName = _transfers.where((element) {
          return (element.senderName
                  .toLowerCase()
                  .contains(event.name.toLowerCase()) ||
              element.receiverName.contains(event.name.toLowerCase()));
        }).toList();

        transfersByName = transfersByName.toSet().toList();
        emit(state.copyWith(
            transfers: transfersByName, status: SearchPageStatus.success));
      }
    } catch (e) {}
  }

  void _getInvoices(GetInvoices event, Emitter<SearchState> emit) {
    emit(state.copyWith(
        type: TransactionType.invoices, status: SearchPageStatus.success));
  }
}
