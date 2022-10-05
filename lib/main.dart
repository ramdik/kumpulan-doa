import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kumpulan Doa',
      home: AnimatedSplashScreen(
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/quran.png',
              height: 54,
              fit: BoxFit.fill,
              color: Colors.white,
            ),
            const Text(
              'Kumpulan Doa',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        nextScreen: const Navigation(),
        splashTransition: SplashTransition.fadeTransition,
        duration: 2500,
        backgroundColor: Colors.lightBlue.shade100,
      ),
    );
  }
}
