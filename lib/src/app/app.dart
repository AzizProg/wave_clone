import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wave_clone/src/presentation/login/login_barrel.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Wave clone',
            builder: (context, widget) {
              return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!);
            },
            debugShowCheckedModeBanner: false, // Thème sombre par défaut
            themeMode:ThemeMode.light,

            home:const LoginPage() ,
          );
        });
  }
}
