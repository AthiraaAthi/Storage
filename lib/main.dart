import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:practising_wrk/model/my_model.dart';
import 'package:practising_wrk/view/home_screen/home_screen.dart';
import 'package:practising_wrk/view/register/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MyModelAdapter());
  var box = await Hive.openBox<MyModel>("MyBox");
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
