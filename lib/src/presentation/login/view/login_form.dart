import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/core/constants/route_names.dart';
import 'package:wave_clone/src/core/extension/number_extension.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';
import 'package:wave_clone/src/core/helpers/asset_helper.dart';
import 'package:wave_clone/src/core/helpers/size_helper.dart';
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

    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (BuildContext context, state) {
            if (state.formStatus == FormStatus.success) {
              Navigator.pushNamedAndRemoveUntil(
                  context, RoutesNames.home, (route) => false);
            }
          },
          child: SafeArea(
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (BuildContext context, state) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(

                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          AssetsHelper.waveLoog,
                          width: context.getWidth(50),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PinCodeCircle(
                              pinCode: state.pinCode.toString(),
                            ),
                            state.formStatus == FormStatus.loading
                                ? const CircularProgressIndicator.adaptive()
                                : Container()
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              IgnorePointer(
                                ignoring: state.formStatus == FormStatus.loading
                                    ? true
                                    : false,
                                child: NumericPad(
                                  selectedValue: (selectedValue) => context
                                      .read<LoginBloc>()
                                      .add(LoginEventPinCodeChanged(
                                          pinCode: selectedValue)),
                                ),
                              ),
                              const Spacer(),
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
      ),
    );
  }
}
