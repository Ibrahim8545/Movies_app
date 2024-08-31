import 'package:flutter/material.dart';
import 'package:moviesapp/screen_details.dart';
import 'package:moviesapp/widget/new_realse_item.dart';
import 'package:moviesapp/widget/top_section_items.dart';
import 'package:moviesapp/utils/app_color.dart';
import 'package:moviesapp/widget/custom_icon_button.dart';
import 'package:moviesapp/widget/realse_item.dart';
import 'package:moviesapp/widget/recommended_item.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TopSectionItems(),
        
          SizedBox(
            height: 20,
          ),
         NewRealseItem(),
          SizedBox(
            height: 20,
          ),
         RecommendedItem(),
          SizedBox(height: 20,)
         
        
        ],
      ),
    );

      
      
  
  }
}
