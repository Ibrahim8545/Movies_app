import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/models/top_section_home_screen_model.dart'; // Ensure this path is correct
import 'package:moviesapp/utils/api_manager.dart'; // Fixed the typo in 'ApiManager'
import 'package:moviesapp/widget/new_realse_list_view.dart'; // Ensure this path is correct
import 'package:moviesapp/widget/recommed_item_list_view.dart'; // Fixed typo in 'recommended'
import 'package:moviesapp/widget/top_section_items.dart';
import 'package:moviesapp/widget/tpo_section_list_view.dart'; // Ensure this path is correct
 // Ensure this path is correct

class HomeTab extends StatelessWidget {
  static const String routeName = 'home_tab';
  HomeTab({super.key});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TopSectionListview(),
          SizedBox(height: 20),
          NewRealseItem(), // Fixed the widget name
          SizedBox(height: 20),
          RecommenedItemListView(), // Fixed typo in 'recommended'
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
