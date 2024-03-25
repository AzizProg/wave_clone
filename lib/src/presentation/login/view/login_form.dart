import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/core/helpers/asset_helper.dart';
import 'package:wave_clone/src/core/helpers/size_helper.dart';
import 'package:wave_clone/src/presentation/home/home.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_bloc.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_event.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_state.dart';
import 'package:wave_clone/src/presentation/login/components/pincode_circle.dart';

import '../components/forget_password_button.dart';
import '../components/numeric_pad.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (BuildContext context, state) {
            if (state.loginState == FormStatus.success) {
              Navigator.pushAndRemoveUntil(
                  context, HomePage.route(), (route) => false);
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (BuildContext context, state) {
              return Padding(
                padding: EdgeInsets.all(SizesHelper.width(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Flexible(
                        fit: FlexFit.tight,
                        child: Image.asset(
                          AssetsHelper.waveLoog,
                          width: SizesHelper.width(50),
                        )),
                    Flexible(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PinCodeCircle(
                          pinCode: state.pinCode.toString(),
                        ),
                        state.loginState == FormStatus.loading
                            ? const CircularProgressIndicator()
                            : Container()
                      ],
                    )),
                    Flexible(
                        child: Column(
                      children: [
                        IgnorePointer(
                          ignoring: state.loginState == FormStatus.loading
                              ? true
                              : false,
                          child: NumericPad(
                            selectedValue: (selectedValue) => context
                                .read<LoginBloc>()
                                .add(LoginEventPinCodeChanged(
                                    pinCode: selectedValue.toString())),
                          ),
                        ),
                        SizedBox(
                          height: SizesHelper.height(10),
                        ),
                        ForgetPasswordButton(onTap: () => null),
                      ],
                    ))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
