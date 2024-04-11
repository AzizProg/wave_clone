import 'package:equatable/equatable.dart';

import '../../../domain/entity/transaction_entity.dart';

enum SearchPageStatus { loading, failed, success }

enum TransactionType {
  transfers,
  invoices,
}

class SearchState extends Equatable {
  final SearchPageStatus status;
  final TransactionType type;
  final List<TransactionEntity>? transfers;
  const SearchState(
      {this.transfers,
      this.type = TransactionType.transfers,
      this.status = SearchPageStatus.loading});

  SearchState copyWith(
      {SearchPageStatus? status,
      TransactionType? type,
      List<TransactionEntity>? transfers}) {
    return SearchState(
      transfers: transfers ?? this.transfers,
      type: type ?? this.type,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status,type, transfers];
}
