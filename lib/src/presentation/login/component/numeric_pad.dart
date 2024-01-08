import 'package:flutter/material.dart';

import '../../../core/helpers/color_helper.dart';
import '../../../core/helpers/size_helper.dart';

class NumericPad extends StatelessWidget {
  final Function(int) selectedValue;
  const NumericPad({super.key, required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    List randPad = [
      _buildNumber(1),
      _buildNumber(2),
      _buildNumber(3),
      _buildNumber(4),
      _buildNumber(5),
      _buildNumber(6),
      _buildNumber(7),
      _buildNumber(8),
      _buildNumber(9),
      _buildNumber(0),
    ];
    randPad.shuffle();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            randPad[0],
            randPad[1],
            randPad[2],
          ],
        ),
        Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            randPad[3],
            randPad[4],
            randPad[5],
          ],
        ),
        Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            randPad[6],
            randPad[7],
            randPad[8],
          ],
        ),
        Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSpace(),
            randPad[9],
            _buildBackSpace(),
          ],
        ),
      ],
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
            padding: EdgeInsets.all(SizesHelper.width(10)),
            child: Text(
              "$number",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: SizesHelper.fontSize(22), fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }

  Widget _buildBackSpace() {
    return Expanded(
        child: InkWell(
            splashFactory: InkRipple.splashFactory,
            splashColor: ColorsHelper.secondaryColor(),
            customBorder: const StadiumBorder(),
            onTap: () {
              selectedValue(-1);
            },
            child: Padding(
              padding: EdgeInsets.all(SizesHelper.width(10)),
              child: Center(
                  child: Icon(Icons.backspace, size: SizesHelper.fontSize(22))),
            )));
  }
}

Widget _buildSpace() {
  return Expanded(child: Container());
}