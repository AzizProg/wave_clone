import 'package:equatable/equatable.dart';

import '../../../domain/entity/transaction_entity.dart';

enum BalanceStatus { displayed, hidden }

enum TransactionStatus { initial, loading, success, failed }

class HomeState extends Equatable {
  final BalanceStatus balanceStatus;
  final TransactionStatus transactionStatus;
   List<TransactionEntity>? transactions;
   HomeState(
      {this.balanceStatus = BalanceStatus.displayed,
      this.transactionStatus = TransactionStatus.initial,this.transactions});
  @override
  List<Object?> get props => [transactionStatus, balanceStatus];

  HomeState copyWith(
      {TransactionStatus? transactionStatus, BalanceStatus? balanceStatus,List<TransactionEntity>? transactions}) {
    return HomeState(
        transactionStatus: transactionStatus ?? this.transactionStatus,
        balanceStatus: balanceStatus ?? this.balanceStatus,
        transactions: transactions ?? this.transactions,
    );
  }
}
