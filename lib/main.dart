import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wave_clone/src/app/app.dart';

void main()  {
  Bloc.observer=AppObserver();
  print("Hello");
  runApp(
     const MyApp(), // Wrap your app
  );
}

class AppObserver extends BlocObserver{
  @override
  void onTransition(Bloc bloc, Transition transition) {
    print("${bloc.toString()},${transition.toString()}");
    super.onTransition(bloc, transition);

  }

}