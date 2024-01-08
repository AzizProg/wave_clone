import 'package:wave_clone/src/domain/entity/transfer_entity.dart';
import 'package:wave_clone/src/domain/repository/transfer_repository.dart';

import '../data_source/local/data_local.dart';

class TransferRepositporyImpl extends TransferRepository{
   DataLocal dataLocal;
  TransferRepositporyImpl({required this.dataLocal});
  @override
  Future<TransferEntity> getTransfer() {
    throw dataLocal.getTransfer();
  }

}