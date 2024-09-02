import 'package:flutter/material.dart';
import 'package:moviesapp/models/new_release_model.dart';



import 'package:moviesapp/screen_details.dart';
import 'package:moviesapp/utils/api_manager.dart';
import 'package:moviesapp/utils/app_color.dart';
import 'package:moviesapp/widget/recommended_item.dart';


class RecommenedItemListView extends StatelessWidget {
  const RecommenedItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColor.iconColor,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Recommended',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 5),
          FutureBuilder(
            future: ApiManger.getRecommendeds(),
            builder: (context, snapshot) {
      
               if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data?.results == null) {
              return Center(child: Text('No data available'));
            } 
          List<Results>res=[];
          res = snapshot.data?.results ?? [];
              return Expanded(
      
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 8,
                ),
                itemBuilder: (context, index) {
                  return RecommendedItem(
              results: res[index], 
                  );
                },
                itemCount: res.length,
                scrollDirection: Axis.horizontal,
              ),
            );
            },
           
          ),
        ]),
      ),
    );
  }
}
