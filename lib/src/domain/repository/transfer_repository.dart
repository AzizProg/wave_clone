import 'package:wave_clone/src/domain/entity/transfer_entity.dart';

abstract class TransferRepository<T>{
  Future<T> getTransfer();
}