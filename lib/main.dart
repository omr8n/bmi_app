import 'package:flutter/material.dart';

void main() {
  runApp(const BmiApp());
}

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(255, 109, 220, 163),
        scaffoldBackgroundColor: const Color.fromARGB(255, 63, 77, 88),
      ),
    );
  }
}
