import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/models/new_release_model.dart';
import 'package:moviesapp/screen_details.dart';

class ReleaseItem extends StatelessWidget {
   ReleaseItem({required this.results, super.key});
Results results;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ScreenDetails.routeName,arguments: results);
      },
      child: Stack(
        children: [
          CachedNetworkImage(
                    imageUrl:
                        "https://image.tmdb.org/t/p/original/${results.posterPath}" ??
                            '',
                   ),
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
    );
  }
}
