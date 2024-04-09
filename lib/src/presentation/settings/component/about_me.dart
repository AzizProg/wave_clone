import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " Wave Money",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Card(
          child: Container(
            width: double.infinity,
            //height: context.getHeight(100),
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  "Wave Money est une plateforme de services financiers numériques opérant en Côte d'Ivoire et au Sénegal. Elle offre une gamme de services financiers accessibles via une application mobile disponible sur AppStore et PlayStore, permettant aux utilisateurs d'effectuer des transactions financières telles que les transferts d'argent et les paiements de factures.",
                  style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
