import 'package:flutter/material.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';

import '../../../core/helpers/asset_helper.dart';
import '../../../core/helpers/size_helper.dart';

class WaveCard extends StatelessWidget {
  const WaveCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.getHeight(140),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(context.getHeight(15)),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                AssetsHelper.basicCard,
              ),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsHelper.qrCodeWithOutBg,
                  fit: BoxFit.fill,
                  width: context.getWidth(120),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt, size: context.getWidth(15)),
                    SizedBox(
                      width: context.getWidth(5),
                    ),
                    const Text("Scanner")
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
