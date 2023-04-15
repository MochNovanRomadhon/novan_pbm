import 'package:flutter/material.dart';
import 'package:novan_pbm/page/login_page.dart';
import 'package:novan_pbm/page/register_page.dart';
import 'package:novan_pbm/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/register": (context) => RegisterPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
      initialRoute: '/login',
    );
  }
}
