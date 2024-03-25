import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_bloc.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: const LoginView(),
        create: (ctx)=> LoginBloc());
  }
}
