import 'package:flutter/material.dart';
import 'package:wave_clone/src/core/constants/route_names.dart';
import 'package:wave_clone/src/domain/entity/transaction_entity.dart';
import 'package:wave_clone/src/presentation/home/home.dart';
import 'package:wave_clone/src/presentation/login/login.dart';
import 'package:wave_clone/src/presentation/settings/view/settings_page.dart';
import 'package:wave_clone/src/presentation/transaction_info/view/transaction_info_page.dart';

class RouteManager {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.login:
        return _pageWithoutAnimation(page: const LoginPage());
      case RoutesNames.home:
        return _page(page: const HomePage());
      case RoutesNames.settings:
        return _pageWithoutAnimation(page: const SettingsPage());
      case RoutesNames.transationInfo:
        var transaction = settings.arguments;
        return _pageWithoutAnimation(
            page: TransactionInfoPage(
          transaction: transaction as TransactionEntity,
        ));
      default:
        return null;
    }
  }

  static MaterialPageRoute _pageWithoutAnimation({required Widget page}) {
    return MaterialPageRoute(
      builder: (_) => page,
    );
  }

  static PageRouteBuilder _page({required Widget page}) {
    return PageRouteBuilder(
        pageBuilder: (_, firstAnime, secondAnime) => page,
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (_, firstAnimation, secondAnimation, child) {
          const begin = Offset(0, 1);
          const end = Offset.zero;
          const curve = Curves.ease;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: firstAnimation.drive(tween),
            child: child,
          );
        });
  }
}
