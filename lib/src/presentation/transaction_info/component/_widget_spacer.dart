import 'package:flutter/cupertino.dart';
import 'package:wave_clone/src/core/extension/size_extension.dart';


Widget spaceBetweenWidget({double spacerSize = 10,required BuildContext context}) {
  final spacer = SizedBox(
    height: context.getWidth(spacerSize),
  );

  return spacer;
}