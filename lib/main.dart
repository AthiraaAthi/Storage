import 'package:flutter/material.dart';
import 'package:practising_wrk/view/home_screen/home_screen.dart';
import 'package:practising_wrk/view/register/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}
