import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';
import 'package:wave_clone/src/core/helpers/asset_helper.dart';

import '_notification_tile.dart';

class NotificationContainer extends StatelessWidget {
  NotificationContainer({super.key});
  final List<Map<String, dynamic>> pictures = [
    {
      "picture": AssetsHelper.bonusCie,
      "title": "Promo CIE prépayé",
      "description":
          "Du 8 Avril Au 5 Mai, gagnez 1.000F de bonus pour votre premier achat d'énergie CIE avec Wave"
    },
    {
      "picture": AssetsHelper.canal,
      "title": "Promo Canal+",
      "description":
      "À partir du 1er Avril, réabonnez-vous en souscrivant à la promo +2000F et bénéficiez de la formule supérieure."
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(.4),
      height: context.getHeight(130),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: pictures.length,
          itemBuilder: (_, index) {
            var picture = pictures[index];
            return notificationTitle(
                picture: picture["picture"],
                context: context,
                title: picture["title"],
                description: picture["description"]);
          }),
    );
  }
}
