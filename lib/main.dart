import 'package:appwrite_phone_login/page_login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.yellow,
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
