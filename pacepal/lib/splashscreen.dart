import 'package:flutter/material.dart';
import 'package:pacepal/loginscreen.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var durasi = const Duration(seconds: 2);

    return Timer(durasi, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return LoginScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/pacepal.jpg',
              height: 250,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
