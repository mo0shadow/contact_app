import 'package:contact/Ui/HomeScreen/home_screen.dart';
import 'package:contact/Ui/SplashScreen/splash_screen.dart';
import 'package:contact/Utils/app_colors.dart';
import 'package:contact/Utils/app_text_style.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact App',
      theme: ThemeData(
        primaryColor: AppColors.darkBlue,
        scaffoldBackgroundColor: AppColors.darkBlue,
        textTheme: TextTheme(
          bodyMedium: AppTextStyle.w500LGold16,
        ),
        useMaterial3: true,
      ),
      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}