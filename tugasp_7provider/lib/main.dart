import 'package:flutter/material.dart';
import 'package:tugasp_7provider/cart_model.dart';
import 'package:tugasp_7provider/product_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create:  (context) => CartModel(),
      child: const MyApp(),  
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TokoDilow',
      home: ProductPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}