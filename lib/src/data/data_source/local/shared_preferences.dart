import 'package:wave_clone/src/data/data_source/local/data_local.dart';
import 'package:wave_clone/src/domain/entity/transfer_entity.dart';

class SharedPreferences extends DataLocal<TransferEntity>{
  SharedPreferences preferences;
  SharedPreferences({required this.preferences});


  @override
  Future<TransferEntity> getTransfer() {
    List.generate(3, (index) => null);

    throw UnimplementedError();
  }

}