import 'package:flutter/material.dart';
import 'package:json_to_soal_parser/src/views/home_view/home_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomeView(),
      },
      initialRoute: '/',
    );
  }
}
