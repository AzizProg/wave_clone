import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';

class PinCodeCircle extends StatelessWidget {
  const PinCodeCircle({Key? key, required this.pinCode}) : super(key: key);
  final String pinCode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:List.generate(4, (index) => _circle(
        position: index+1 ,
        context: context,
        isActive: pinCode.length >= index + 1,))
    );
  }


  Widget _circle({
    required int position,
    required BuildContext context,
    required bool isActive,
  }) {
    return AnimatedContainer(
      width: context.getWidth(15),
      height: context.getHeight(15),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isActive ? ColorsHelper.primaryColor : ColorsHelper.secondaryColor,
        shape: BoxShape.circle,
      ),
      duration: const Duration(milliseconds: 400),
    );
  }
}
