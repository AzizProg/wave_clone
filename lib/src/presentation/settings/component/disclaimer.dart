import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';
import 'package:wave_clone/src/core/helpers/asset_helper.dart';

class Disclaimer extends StatelessWidget {
  const Disclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " Disclaimer",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              children: [
                Lottie.asset(AssetsHelper.disclaimer,
                    width: context.getWidth(80)),
                Text(
                  "Cette application n'est qu'une reproduction (clone) à des fins éducatives de la vraie version disponible sur les plateformes de téléchargement.",
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
