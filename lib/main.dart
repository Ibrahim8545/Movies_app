import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviesapp/main_home_screen.dart';
import 'package:moviesapp/screen_details.dart';
import 'package:moviesapp/splash_screen.dart';
import 'package:moviesapp/utils/api_manager.dart';
import 'package:moviesapp/utils/app_color.dart';

void main() {
  //  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle( 
  //           statusBarColor: Colors.blue, 
  //     )); 
  //print(ApiManger.getTopSection());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        MainHomeScreen.routeName: (context) => MainHomeScreen(),
        ScreenDetails.routeName: (context) => ScreenDetails(),
      },
    );
  }
}
