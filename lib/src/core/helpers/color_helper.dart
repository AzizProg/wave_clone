import 'dart:ui';

class ColorsHelper{
  ColorsHelper._();
  static Color get primaryColor  => const Color(0xFF454ECD);
  static Color get secondaryColor  => const Color(0xFF5CC6FA);
  static Color get buttonNotValid  => const Color(0xFF5CC6FA).withOpacity(0.2);
  static Color get actionButtonTransfer => const Color.fromRGBO(223, 229, 253, 1);

  static Color get actionButtonPayment => const Color.fromRGBO(254, 248, 241, 1);

  static Color get actionButtonBank => const Color.fromRGBO(253, 240, 240, 1);
  static Color get backgroundColor => const Color(0xFFf1f1f1);
}