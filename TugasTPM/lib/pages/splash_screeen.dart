import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home : Scaffold(
            backgroundColor: Colors.white,
            body: Center(
                child: Container(
                    child: Image.asset("assets/images/splash-screen.png",
                      height: 200,
                      width: 200,
                    )
                )
            )
        )
    );
  }
}