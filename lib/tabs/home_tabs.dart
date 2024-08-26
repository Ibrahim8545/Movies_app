import 'package:flutter/material.dart';
import 'package:moviesapp/utils/app_color.dart';

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
              Positioned(
                  top: 58,
                  left: 8,
                  child: Container(
                   
                    decoration: BoxDecoration(
                          image: DecorationImage(
                      image: AssetImage('assets/images/Icon awesome-bookmark.png'),
                      fit: BoxFit.contain
                    ),
                    // The background color is set to transparent
                    color: Colors.transparent,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          Container(
            color: AppColor.iconColor,)
        ],
      ),
    );
  }
}
