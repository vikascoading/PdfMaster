
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const PDFMasterApp());
}

class PDFMasterApp extends StatelessWidget {
  const PDFMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PDFMaster',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF0D47A1),
        scaffoldBackgroundColor: const Color(0xFF071226),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF071226),
          foregroundColor: Color(0xFFFFB300),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFFB300)),
      ),
      home: const HomeScreen(),
    );
  }
}
