import 'package:flutter/material.dart';
import 'package:plant_app/ui/onboarding_screen.dart';
import 'package:plant_app/ui/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Onboarding Saree",
      home:OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
