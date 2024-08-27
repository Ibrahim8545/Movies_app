import 'package:flutter/material.dart';
import 'package:moviesapp/screen_details.dart';
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
          Stack(
            children: [
              Image.asset('assets/images/Image.png'),
              Container(
                padding: const EdgeInsets.only(top: 60, left: 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/imagell.png'),
                    SizedBox(
                      width: 7,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dora and the lost city of gold',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          '2019  PG-13  2h 7m',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              ),
              CustomIconButton(onPressed: () {})
            ],
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
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
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: InkWell(
              onTap: (){
                 Navigator.pushNamed(context, ScreenDetails.routeName);
              },
              child: Container(
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
               SizedBox(
                        height: 5
                      ),
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
          ),
          SizedBox(height: 20,)
         
        
        ],
      ),
    );

      
      
  
  }
}
