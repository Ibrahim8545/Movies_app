import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/models/top_section_home_screen_model.dart';
import 'package:moviesapp/widget/custom_icon_button.dart'; // Ensure this path is correct

class TopSectioScreen extends StatelessWidget {
  Results result;

  TopSectioScreen({required this.result, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
            imageUrl:
           result.backdropPath != null
    ? "https://image.tmdb.org/t/p/original/${result.backdropPath}"
    : 'https://example.com/placeholder.png', 
     placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
    ),
        Container(
          padding: const EdgeInsets.only(top: 60, left: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl:
                result.posterPath != null
    ? "https://image.tmdb.org/t/p/original/${result.posterPath}"
    : 'https://example.com/placeholder.png', // Placeholder URL if imagePath is null
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(width: 7),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    result.title ?? '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    result.releaseDate ?? '',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

      ],
    );
  }
}
