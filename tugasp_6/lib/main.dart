import 'package:flutter/material.dart';
import 'package:tugasp_6/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'tugasp_6',
      home: HomePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        )
      ),
    );
  }
}