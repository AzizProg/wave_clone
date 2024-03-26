import 'package:wave_clone/src/domain/entity/transaction_entity.dart';

abstract class TransactionRepository<T>{
   Future<T>  getAllTransaction();

}