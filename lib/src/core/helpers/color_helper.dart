import 'dart:ui';

class ColorsHelper{
  ColorsHelper._();
  static Color  primaryColor()  => const Color(0xFF454ECD);
  static Color secondaryColor() => const Color(0xFF5CC6FA);
  static Color buttonNotValid() => const Color(0xFF5CC6FA).withOpacity(0.2);
  static Color actionButtonTransfer()=> const Color.fromRGBO(223, 229, 253, 1);

  static Color actionButtonPayment()=> const Color.fromRGBO(254, 248, 241, 1);

  static Color actionButtonBank()=> const Color.fromRGBO(253, 240, 240, 1);
}