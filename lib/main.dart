import 'package:car_details_app/app/presentation/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Details App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CarApp(),
    );
  }
}
