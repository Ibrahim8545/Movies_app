import 'package:flutter/material.dart';
import 'package:moviesapp/screen_details.dart';
import 'package:moviesapp/utils/app_color.dart';
import 'package:moviesapp/widget/recommended_item.dart';

class RecommenedItemListView extends StatelessWidget {
  const RecommenedItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ScreenDetails.routeName);
        },
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
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 8,
                ),
                itemBuilder: (context, index) {
                  return RecommendedItem();
                },
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
