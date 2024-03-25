import 'package:flutter/cupertino.dart';

import '../../../core/helpers/asset_helper.dart';
import '../../../core/helpers/size_helper.dart';

class WaveCard extends StatelessWidget {
  const WaveCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(SizesHelper.radius(10))),
      child: Image.asset(
        AssetsHelper.basicCard,
        // fit: BoxFit.cover,
      ),
    );
  }
}
