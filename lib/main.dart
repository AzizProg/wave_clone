import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/app/app.dart';

void main()  {

  Bloc.observer=AppObserver();
  runApp(
     const MyApp(),
  );
}

class AppObserver extends BlocObserver{
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

  }

}