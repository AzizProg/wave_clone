// forget_password_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_bloc.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_events.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_states.dart';

class ForgetPasswordButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final Color textColor;

  ForgetPasswordButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);
  bool buttonPressed = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginFormState>(
      buildWhen: (previous,current)=> previous.loginStates !=current.loginStates,
      builder: (context, state) {
print(buttonPressed);

        if (state is LoginStateForgetButtonPressed) {
          buttonPressed = true;
        } else if (state is LoginStateForgetButtonReleased) {
          buttonPressed = false;
        }

        return GestureDetector(
          onTapDown: (TapDownDetails details) {
            context.read<LoginBloc>().add(LoginEventForgetButtonPressed());
          },
          onTapUp: (TapUpDetails details) {
            context.read<LoginBloc>().add(LoginEventForgetButtonReleased());

          },
          onTapCancel: () {
            context.read<LoginBloc>().add(LoginEventForgetButtonReleased());
          },
          onTap: onTap,
          child: AnimatedDefaultTextStyle(
            style: TextStyle(color: buttonPressed ? Colors.red : Colors.green),
            duration: const Duration(milliseconds: 200),
            child: Text(
              text,
              style: TextStyle(color: buttonPressed ? Colors.red : Colors.green),
            ),
          ),
        );
      },
    );
  }
}
