import 'package:intl/intl.dart';

extension  FormatPrice on double{
  String get formatPrice {
    NumberFormat numberFormat = NumberFormat('#,###');
    return numberFormat.format(this);
  }
}