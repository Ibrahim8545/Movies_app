import 'package:flutter/material.dart';
import 'package:moviesapp/tabs/browser_tabs.dart';
import 'package:moviesapp/tabs/home_tabs.dart';
import 'package:moviesapp/tabs/search_tab.dart';
import 'package:moviesapp/tabs/watchlist_tab.dart';
import 'package:moviesapp/utils/app_color.dart';

class MainHomeScreen extends StatefulWidget {
  static const routeName = '/home';
   MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int selecedIndex=0;

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      
       bottomNavigationBar: BottomNavigationBar(
          currentIndex: selecedIndex,
          onTap: (index) {
            selecedIndex = index;
            setState(() {
              
            });
            
          },
          type: BottomNavigationBarType.fixed,

          backgroundColor: Color(0xff000000),
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: ImageIcon(AssetImage("assets/images/home.png")),
                label: "Home"),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: ImageIcon(AssetImage("assets/images/search-2.png")),
                label: "Search"),

            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: ImageIcon(AssetImage("assets/images/Icon material-movie.png")),
                label: "Browser"),
            BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: ImageIcon(AssetImage("assets/images/watchlist.png")),
                label: "WatchLast"),
          ]),
          body: tabs[selecedIndex],

    );
    
  }

   List<Widget>tabs=[
   HomeTab(),
   SearchTab(),
   BrowserTab(),
   WatchListTab(),
  ];
}