import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/presentation/home/bloc/home_state.dart';

import '../bloc/home_bloc.dart';

class TransactionSection extends StatelessWidget {
  const TransactionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (_, state) {
      if(state == HomeStateLoading){
        return const Center(
          child: CircularProgressIndicator(),
        );

      }else{
        return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (_,index){
              return null;
            });
      }




    });
  }
}
