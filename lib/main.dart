import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/bloc/observer.dart';

import 'package:moviesapp/main_home_screen.dart';
import 'package:moviesapp/provider/new_reasles_provider.dart';
import 'package:moviesapp/screen_details.dart';
import 'package:moviesapp/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moviesapp/tabs/home_tabs.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main()async {
  //  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle( 
  //           statusBarColor: Colors.blue, 
  //     )); 
  Bloc.observer = MyBlocObserver();
    WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
 runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WatchListProvider()),
        // other providers
      ],
      child: MyApp(),
    ),
  );
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
        ScreenDetails.routeName: (context) => ScreenDetails(movie: null,),
       HomeTab.routeName: (context) => HomeTab(),
      },
    );
  }
}
