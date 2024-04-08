
import 'package:flutter/cupertino.dart';

extension WidthHelper on BuildContext {
  double get screenWidth {
    return MediaQuery.sizeOf(this).width;
  }
//Define a value for screen
  double getWidth(double size) {
    return (screenWidth * size) / screenWidth;
  }

  double get getHalfWidth => (screenWidth/2);

  double get getThirdOfWidth => screenWidth/3;

}

extension HeightHelper on BuildContext {
  double get screenHeight {
    return MediaQuery.sizeOf(this).height;
  }
//Define a value for screen
  double getHeight(double size) {
    return (screenHeight * size) / screenHeight;
  }

  double get getHalfHeight => screenHeight/2;

  double get getThirdOfHeight => screenHeight/3;

}
