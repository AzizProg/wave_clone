import 'package:flutter/material.dart';
import 'package:wave_clone/src/core/helpers/asset_helper.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';
import 'package:wave_clone/src/core/helpers/size_helper.dart';

class HomeActionButtons extends StatelessWidget {
  const HomeActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _actionButton(
            color: ColorsHelper.actionButtonTransfer(),
            asset: AssetsHelper.transferToPerson,
            subtitle: "Transfert"),
        _actionButton(
            color: ColorsHelper.actionButtonPayment(),
            asset: AssetsHelper.payBill,
            subtitle: "Payments"),
        _actionButton(
            color: ColorsHelper.actionButtonBank(),
            asset: AssetsHelper.bankSymbol,
            subtitle: "Banque"),
      ],
    );
  }

  Widget _actionButton(
      {required Color color, required String asset, required subtitle}) {
    return Column(
      children: [
        CircleAvatar(
          radius: SizesHelper.radius(25),
          backgroundColor: color,
          // backgroundImage: AssetImage(asset),
          child: ClipOval(
              child: Image.asset(
            asset,
            width: SizesHelper.width(40),
          )),
        ),
        Text(subtitle)
      ],
    );
  }
}
