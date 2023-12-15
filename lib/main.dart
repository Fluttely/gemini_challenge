import 'package:flutter/material.dart';
import 'package:gemini_challenge/pages/technologies_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
      ),
      home: const TecnologiesPage(),
    );
  }
}

class GlobalKeys {
  static final GlobalKey appBarKey = GlobalKey();
  static final GlobalKey area2Key = GlobalKey();
  static final GlobalKey area3Key = GlobalKey();
  static final GlobalKey area4Key = GlobalKey();
}
