import 'package:farmacia_app/data/cart_inherited.dart';
import 'package:farmacia_app/screens/initial_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: InheritedCart(child: const InitialScreen()),
    );
  }
}



