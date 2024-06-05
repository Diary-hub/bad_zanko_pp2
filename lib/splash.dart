import 'dart:async';
import 'package:bad_zanko_pp/firstpage.dart';
import 'package:flutter/material.dart';
import 'package:bad_zanko_pp/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const FirstPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
            image: NetworkImage(
                'https://cdn.dribbble.com/users/3151485/screenshots/6671159/obese_run_gif.gif'),
          ),
          CircularProgressIndicator.adaptive()
        ],
      ),
    );
  }
}
