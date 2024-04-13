import 'package:flutter/material.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';
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
            color: ColorsHelper.actionButtonTransfer,
            asset: AssetsHelper.transferToPerson,
            subtitle: "Transfert",context: context),
        _actionButton(
            color: ColorsHelper.actionButtonPayment,
            asset: AssetsHelper.payBill,
            subtitle: "Payments", context: context),
        _actionButton(
            color: ColorsHelper.actionButtonBank,
            asset: AssetsHelper.bankSymbol,
            subtitle: "Banque",context: context),
      ],
    );
  }

  Widget _actionButton(
      {required Color color, required String asset, required subtitle,required BuildContext context}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: color,
          // backgroundImage: AssetImage(asset),
          child: ClipOval(
              child: Image.asset(
            asset,
            width: context.getWidth(40),
          )),
        ),
        Text(subtitle)
      ],
    );
  }
}
