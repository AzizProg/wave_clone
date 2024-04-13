// forget_password_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_bloc.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_state.dart';

class ForgetPasswordButton extends StatelessWidget {
  final Function() onTap;


  const ForgetPasswordButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous,current)=> previous.runtimeType !=current.runtimeType,
      builder: (context, state) {




        return GestureDetector(

          onTap: onTap,
          child: Text(
            "Oublié votre code secret?",
            style: TextStyle(color: ColorsHelper.secondaryColor),
          ),
        );
      },
    );
  }
}
