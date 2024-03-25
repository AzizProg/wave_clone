import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wave_clone/src/presentation/home/home.dart';
import 'package:wave_clone/src/presentation/login/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(365, 680),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return  MaterialApp(
            onGenerateRoute: (settings) => HomePage.route(),
            title: 'Wave clone',
            debugShowCheckedModeBanner: false, // Thème sombre par défaut
            themeMode:ThemeMode.light,
            home:const LoginPage() ,
          );
        });
  }
}
