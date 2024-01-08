import 'package:wave_clone/src/data/repository_impl/transfer_repository_impl.dart';

import '../entity/transfer_entity.dart';

class GetTransferUsecase{
  final TransferRepositporyImpl transferRepositporyImpl;
  GetTransferUsecase({required this.transferRepositporyImpl});

  Future<TransferEntity> getTransfer(){
    return transferRepositporyImpl.getTransfer();
  }
}