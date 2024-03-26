import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/presentation/transaction_info/bloc/transac_info_state_bloc.dart';
import 'package:wave_clone/src/presentation/transaction_info/bloc/transaction_info_event_bloc.dart';

class TransacInfoBloc extends Bloc<TransactInfoEvent,TransacInfoState>{
  TransacInfoBloc(super.initialState);

}