


import 'package:flutter/material.dart';
import 'package:store/onpoarding_Screen/onboarding_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     Future.delayed(Duration(seconds: 2),(){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>OnBoardingScreen()));
     });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(child: Center(child: Image.asset('images/on_poarding.png')))
      ],),

    );
  }
}

