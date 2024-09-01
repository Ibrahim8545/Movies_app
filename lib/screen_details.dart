import 'package:flutter/material.dart';
import 'package:moviesapp/utils/app_color.dart';
import 'package:moviesapp/utils/styles.dart';
import 'package:moviesapp/widget/recommended_item.dart';
import 'package:moviesapp/widget/type_of_film_container.dart';

class ScreenDetails extends StatelessWidget {
  static const routeName = '/screen_details';
  const ScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white, size: 30),
          backgroundColor: AppColor.iconColor,
          title: Text(
            'Dora and the lost city of gold',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Image.asset('assets/images/Image.png'),
            Container(
              padding: EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dora and the lost city of gold',
                    style: Styles.textStyle18,
                  ),
                  Text(
                    '2019  PG-13  2h 7m',
                    style:
                        Styles.textStyle14.copyWith(color: Color(0xffB5B4B4)),
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/imagell.png',
                        height: 199,
                        width: 120, // Set a width to control image size
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10), // Add spacing between image and text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 5.0, // Horizontal space between children
                              runSpacing: 5.0,
                              children: [
                                TypeOfFilm(text: 'Action'),
                                TypeOfFilm(text: 'Action'),
                                TypeOfFilm(text: 'Action'),
                                TypeOfFilm(text: 'Action'),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.',
                              style: Styles.textStyle14,
                              textAlign: TextAlign
                                  .justify, // Optional: Align text justify
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
          

          ],
        ),
      ),
    );
  }
}
