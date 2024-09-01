import 'package:flutter/material.dart';
import 'package:moviesapp/screen_details.dart';
import 'package:moviesapp/utils/app_color.dart';
import 'package:moviesapp/widget/realse_item.dart';

class NewRealseItem extends StatelessWidget {
  const NewRealseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
            onTap: () {
              Navigator.pushNamed(context, ScreenDetails.routeName);
            },
            child: Container(
              width: double.infinity,
              color: AppColor.iconColor,
              height: 187,
              padding: EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'New Releases',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Expanded(
                     
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          width: 8,
                        ),
                        itemBuilder: (context, index) {
                          return ReleaseItem();
                        },
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ]),
            ),
          );
  }
}