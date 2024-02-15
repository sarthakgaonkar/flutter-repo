import 'package:flutter/material.dart';
import 'package:flutter_firebase_tut1/dropdown.dart';
import 'package:flutter_firebase_tut1/forms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DropDownWidget() //skeleton of the app
    );
  }
}

