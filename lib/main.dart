import "package:flutter/material.dart";
import './lock_screen.dart';

void main() {
  runApp(const WaveApp());
}

class WaveApp extends StatelessWidget {
  const WaveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const WaveAppState(),
    );
  }
}

class WaveAppState extends StatefulWidget {
  const WaveAppState({super.key});
  @override
  State<WaveAppState> createState() => _WaveAppState();
}

class _WaveAppState extends State<WaveAppState> {
  @override
  Widget build(BuildContext context) {
    return const LockScreen();
  }
}
