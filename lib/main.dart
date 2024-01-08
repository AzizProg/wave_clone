import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wave_clone/src/app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await SharedPreferences.getInstance();
  runApp(const MyApp());
}
