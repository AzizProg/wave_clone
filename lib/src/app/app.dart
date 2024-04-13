import 'package:flutter/material.dart';
import 'package:wave_clone/src/config/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

            onGenerateRoute: (settings) => RouteManager.onGenerateRoute(settings),
            title: 'Wave clone',
            debugShowCheckedModeBanner: false, // Thème sombre par défaut
            themeMode: ThemeMode.light,
            builder: (_, widget) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: widget!);
            },
          );

  }
}
//
//
// Widget build(BuildContext context) {
//   return ScreenUtilInit(
//       designSize: const Size(365, 680),
//       minTextAdapt: true,
//       splitScreenMode: true,
//
//       builder: (_, child) {
//         return MaterialApp(
//
//           onGenerateRoute: (settings) => RouteManager.onGenerateRoute(settings),
//           title: 'Wave clone',
//           debugShowCheckedModeBanner: false, // Thème sombre par défaut
//           themeMode: ThemeMode.light,
//           builder: (_, widget) {
//             return MediaQuery(
//                 data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
//                 child: widget!);
//           },
//         );
//       });
// }