import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/models/top_section_home_screen_model.dart'; // Ensure this path is correct
import 'package:moviesapp/utils/api_manager.dart'; // Fixed the typo in 'ApiManager'
import 'package:moviesapp/widget/new_realse_item.dart'; // Ensure this path is correct
import 'package:moviesapp/widget/recommed_item_list_view.dart'; // Fixed typo in 'recommended'
import 'package:moviesapp/widget/top_section_items.dart'; // Ensure this path is correct
 // Ensure this path is correct

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  List<Results> res = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          FutureBuilder<TopSectionHomeScreenModel>(
            future: ApiManger.getTopSection(), // Ensure correct method name
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data?.results == null) {
                return Center(child: Text('No data available'));
              } else {
                res = snapshot.data!.results ?? [];

                return CarouselSlider.builder(
                  itemCount: res.length,
                  itemBuilder: (context, index, pageViewIndex) { 
                    return TopSectioScreen(
                      result: res[index],
                    );
                  },
                  options: CarouselOptions(
                    height: 250,
                    autoPlay: true,
                    viewportFraction: 1,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration: const Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
        //   SizedBox(height: 20),
        //   NewRealseItem(), // Fixed the widget name
        //   SizedBox(height: 20),
        //   RecommenedItemListView(), // Fixed typo in 'recommended'
        //   SizedBox(height: 20),
        ],
      ),
    );
  }
}
