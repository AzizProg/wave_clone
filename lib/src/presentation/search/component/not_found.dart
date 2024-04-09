import 'package:flutter/material.dart';

import '../../../core/helpers/asset_helper.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(AssetsHelper.searchLogo),
          Text.rich(
            TextSpan(
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                text:
                    "Désolé, nous n'avons pas trouvé de résultat pour votre recherche\n\n",
                children: [
                  TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      text: "Veuillez réessayer")
                ]),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
