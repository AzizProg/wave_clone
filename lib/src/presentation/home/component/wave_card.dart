import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/helpers/asset_helper.dart';
import '../../../core/helpers/size_helper.dart';

class WaveCard extends StatelessWidget {
  const WaveCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: SizesHelper.height(140),
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: SizesHelper.width(50)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizesHelper.width(15)),
            image: DecorationImage(
              isAntiAlias: true,
              fit: BoxFit.cover,
              image: AssetImage(
                AssetsHelper.basicCard,
              ),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetsHelper.qrCodeWithOutBg,
              width: SizesHelper.height(110),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt, size: SizesHelper.width(15)),
                SizedBox(
                  width: SizesHelper.width(5),
                ),
                const Text("Scanner")
              ],
            ),
          ],
        ));
  }
}
