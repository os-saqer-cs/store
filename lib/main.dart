import 'package:flutter/material.dart';

import 'package:store/Network/dio_helper/dio_helper.dart';
import 'package:store/splash_Screen/splash_screen.dart';

import 'onpoarding_Screen/onboarding_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : SplashScreen(),
    );
  }

// This widget is the root of your application.
}