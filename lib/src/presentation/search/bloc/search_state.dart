import 'package:equatable/equatable.dart';

import '../../../domain/entity/transaction_entity.dart';

enum SearchPageStatus { initial, loading, failed, success }

class SearchState extends Equatable {
  final SearchPageStatus status;
  final List<TransactionEntity>? transfers;
  const SearchState({this.transfers, this.status = SearchPageStatus.initial});

  SearchState copyWith(
      {SearchPageStatus? status, List<TransactionEntity>? transfers}) {
    return SearchState(
      transfers: transfers ?? this.transfers,
      status: status ?? this.status,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, transfers];
}
