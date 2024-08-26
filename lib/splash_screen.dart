import 'package:flutter/material.dart';
import 'package:moviesapp/main_home_screen.dart';
import 'package:moviesapp/utils/app_color.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const String routeName = 'splash';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(seconds: 1),
        () {
         
            Navigator.pushReplacementNamed(context, MainHomeScreen.routeName);
         
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primaryColor,
      child: Column(
        children: [
          const Spacer(),
          Center(
            child: Image.asset(
              'assets/images/movies.png',
              height: 211,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
