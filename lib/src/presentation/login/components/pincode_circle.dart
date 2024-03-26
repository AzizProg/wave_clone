import 'package:flutter/cupertino.dart';
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
        _circle(pinCode.isNotEmpty
            ? ColorsHelper.primaryColor()
            : ColorsHelper.secondaryColor()),
        _circle(pinCode.length == 2
            ? ColorsHelper.primaryColor()
            : ColorsHelper.secondaryColor()),
        _circle(pinCode.length == 3
            ? ColorsHelper.primaryColor()
            : ColorsHelper.secondaryColor()),
        _circle(pinCode.length == 4
            ? ColorsHelper.primaryColor()
            : ColorsHelper.secondaryColor()),
      ],
    );
  }

  Widget _circle(Color color) {
    return AnimatedContainer(
      width: SizesHelper.width(15),
      height: SizesHelper.height(15),
      margin: EdgeInsets.all(SizesHelper.width(10)),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}
