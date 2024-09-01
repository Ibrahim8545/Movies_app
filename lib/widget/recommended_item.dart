import 'package:flutter/material.dart';
import 'package:moviesapp/utils/app_color.dart';
import 'package:moviesapp/widget/realse_item.dart';

class RecommendedItem extends StatelessWidget {
  const RecommendedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96.87,
      color: Color(0xff343534),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Stack(
    
      children: [
        Image.asset('assets/images/imagell.png',fit: BoxFit.fill,),
        Positioned(
          top: -1,
          left: -6,
          child: Container(
    
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Icon awesome-bookmark.png'),
                  fit: BoxFit.contain,),  
             
              color: Colors.transparent,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 10,
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
          ),
         Padding(
           padding: const EdgeInsets.only(
            left: 8,
            right: 8
           ),
           child: Column(
            children: [
               Text(
              'Deadpool 2',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Text(
              '2018  R  1h 59m',
              style: TextStyle(
                color: Color(0xffB5B4B4),
                fontSize: 8,
              ),
            ),
            ],
           ),
         ),
          
        ],
      ),
    );
  }
}
