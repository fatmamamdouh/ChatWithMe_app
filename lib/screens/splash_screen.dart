import 'dart:async';

import 'package:chats/screens/onboarding/onboarding_screen.dart';
import 'package:chats/style/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2,),
            Icon(
                    Icons.messenger,
                    size: 130,
                    color: secondaryColor,
                ),
            Spacer(flex: 2,),
            Text(
              "As fast as lightning, ",
              style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),),
            Text(
              "as delicious as thunder!",
              style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),),
            Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }
}
