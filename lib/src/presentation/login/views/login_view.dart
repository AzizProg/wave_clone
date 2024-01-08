import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_bloc.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_states.dart';
import 'package:wave_clone/src/presentation/login/component/forget_password_button.dart';
import 'package:wave_clone/src/presentation/login/component/numeric_pad.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc,LoginFormState>(
        listenWhen: (previous,current)=> previous.loginStates != current.loginStates,
        listener: (BuildContext context, state) {

        },
        child: BlocBuilder<LoginBloc,LoginFormState>(builder: (BuildContext context, state) {

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumericPad(selectedValue: (selectedValue){}),

              ForgetPasswordButton(text: "Oublié votre code secret?", textColor: ColorsHelper.secondaryColor(), onTap: ()=> null),
            ],
          );
        },),
      ),
    );
  }
}
