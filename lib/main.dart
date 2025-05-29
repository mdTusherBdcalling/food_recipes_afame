import 'package:flutter/material.dart';
import 'package:food_recipes_afame/Onboarding/onboarding_view.dart';

import 'package:food_recipes_afame/core/colors.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AFAME',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Roboto', // optional, change as per your font
      ),
      home: OnboardingView(),
    );
  }
}
//https://chatgpt.com/c/6835418a-2d78-8010-be54-fc28236e5515