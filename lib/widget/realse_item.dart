import 'package:flutter/material.dart';

class ReleaseItem extends StatelessWidget {
  const ReleaseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Stack(
        children: [
          Image.asset('assets/images/realasetest.png',
          height: 
      127.7,),
          Positioned(
            top: -1,
            left: -6,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Icon awesome-bookmark.png'),
                    fit: BoxFit.contain),
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
            ),
          )
        ],
      ),
    );
  }
}
