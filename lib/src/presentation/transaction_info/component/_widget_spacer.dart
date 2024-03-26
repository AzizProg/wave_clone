import 'package:flutter/cupertino.dart';

import '../../../core/helpers/size_helper.dart';

Widget spaceBetweenWidget({double spacerSize = 10}) {
  final spacer = SizedBox(
    height: SizesHelper.width(spacerSize),
  );

  return spacer;
}