import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MagazineMakerApp());
}

class MagazineMakerApp extends StatelessWidget {
  const MagazineMakerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magazine Maker',
      theme: appDarkTheme,       // Our custom dark theme
      home: const MyHomePage(title: 'Magazine Maker Home'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text('Hello, MagazineMaker!'),
      ),
    );
  }
}
