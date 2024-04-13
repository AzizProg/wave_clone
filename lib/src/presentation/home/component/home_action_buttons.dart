import 'package:flutter/material.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';
import 'package:wave_clone/src/core/helpers/asset_helper.dart';
import 'package:wave_clone/src/core/helpers/color_helper.dart';

class HomeActionButtons extends StatelessWidget {
  const HomeActionButtons({Key? key});

  @override
  Widget build(BuildContext context) {
    final buttonsData = [
      {
        'color': ColorsHelper.actionButtonTransfer,
        'asset': AssetsHelper.transferToPerson,
        'subtitle': 'Transfert',
      },
      {
        'color': ColorsHelper.actionButtonPayment,
        'asset': AssetsHelper.payBill,
        'subtitle': 'Payments',
      },
      {
        'color': ColorsHelper.actionButtonBank,
        'asset': AssetsHelper.bankSymbol,
        'subtitle': 'Banque',
      },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        buttonsData.length,
            (index) => _actionButton(
          color: buttonsData[index]['color'] as Color,
          asset: buttonsData[index]['asset'] as String,
          subtitle: buttonsData[index]['subtitle'] as String,
          context: context,
        ),
      ),
    );
  }

  Widget _actionButton({
    required Color color,
    required String asset,
    required String subtitle,
    required BuildContext context,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: color,
          child: ClipOval(
            child: Image.asset(
              asset,
              width: context.getWidth(40),
            ),
          ),
        ),
        Text(subtitle),
      ],
    );
  }
}
