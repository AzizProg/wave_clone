import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_bloc.dart';
import 'package:wave_clone/src/presentation/login/bloc/login_state.dart';
import '../../../core/helpers/color_helper.dart';
import '../../../core/helpers/size_helper.dart';

class NumericPad extends StatelessWidget {
  final Function(int) selectedValue;

  const NumericPad({Key? key, required this.selectedValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List randPad = List.generate(10, (index) => _buildNumber(index));

    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous,next)=> previous.pinCode !=next.pinCode,
      listener: (BuildContext context, state) {
       randPad.shuffle();
      },
      child:BlocBuilder<LoginBloc,LoginState>(
        buildWhen: (previous,next)=> previous.pinCode != next.pinCode,
        builder:(_,state) {
          return Column(
            children: [
              for (int i = 0; i < 3; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [...randPad.sublist(i * 3, i * 3 + 3)],
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSpace(),
                  randPad.last,
                  _buildBackSpace(),
                ],
              ),
            ],
          );
        },
   )
    );
  }

  Widget _buildNumber(int number) {
    return Expanded(
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        splashColor: ColorsHelper.secondaryColor(),
        customBorder: const StadiumBorder(),

        onTap: () {
          selectedValue(number);
        },
        child: Padding(
          padding: EdgeInsets.all(SizesHelper.radius(10)),
          child: Text(
            "$number",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizesHelper.fontSize(22),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackSpace() {
    return Flexible(
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        splashColor: ColorsHelper.secondaryColor(),
        customBorder: const StadiumBorder(),
        onTap: () {
          selectedValue(-1);
        },
        child: Padding(
          padding: EdgeInsets.all(SizesHelper.radius(10)),
          child: Center(
            child: Icon(
              Icons.backspace,
              size: SizesHelper.fontSize(22),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpace() {
    return Flexible(child: Container());
  }
}
