import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';
import 'package:wave_clone/src/core/helpers/size_helper.dart';

class PinCodeCircle extends StatelessWidget {
  const PinCodeCircle({super.key, required this.pinCode});
  final String pinCode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _circle(1),
        _circle(2),
        _circle(3),
        _circle(4),

      ],
    );
  }

  Widget _circle(int position) {
    return AnimatedContainer(
      width: SizesHelper.width(15),
      height: SizesHelper.height(15),
      margin: EdgeInsets.all(SizesHelper.width(10)),
      decoration: BoxDecoration(
        color: pinCode.length >= position
            ? ColorsHelper.primaryColor()
            : ColorsHelper.secondaryColor(),
        shape: BoxShape.circle,
      ),
      duration: const Duration(milliseconds: 400),
    );
  }
}
