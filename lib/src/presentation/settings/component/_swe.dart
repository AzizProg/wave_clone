import 'package:flutter/material.dart';

import '../../../core/helpers/color_helper.dart';

class Swe extends StatelessWidget {
  const Swe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 2,
                offset: const Offset(0, 2),
                color: ColorsHelper.primaryColor
                    .withOpacity(0.2))
          ],
          color: ColorsHelper.primaryColor.withOpacity(0.2),
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))),
      child: const Center(
        child: Text(
          "SWE",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
