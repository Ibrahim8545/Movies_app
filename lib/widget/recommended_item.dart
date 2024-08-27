import 'package:flutter/material.dart';
import 'package:moviesapp/utils/app_color.dart';
import 'package:moviesapp/widget/realse_item.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.iconColor,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommended',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 5),
          Container(
            width: 96.87,
            color: Color(0xff343534),
           
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ReleaseItem(),
                SizedBox(height: 8), // Space between items
                Row(
                 
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(
                        Icons.star,
                        color: Colors.deepOrange,
                        size: 20,
                      ),
                    ),
                    Text(
                      '7.7',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Deadpool 2',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '2018  R  1h 59m',
                  style: TextStyle(
                    color: Color(0xffB5B4B4),
                    fontSize: 8,
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
