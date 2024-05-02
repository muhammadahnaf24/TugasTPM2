import 'package:flutter/material.dart';
import 'package:tugas1/pages/home_page.dart';
import 'package:tugas1/pages/login_screen.dart';
import 'package:tugas1/pages/splash_screeen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                  primarySwatch: Colors.blue),
              // home: LoginScreen(username: "", password: ""),
              routes: {
                '/': (context) => LoginScreen(username: "", password: ""),
                '/home': (context) => HomePage(pass: '', user: '',),
              },
            );
          }
        });
  }
}