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
                result.backdropPath != null ? "https://image.tmdb.org/t/p/original/${result.backdropPath}" : 'path/to/default/image',
            placeholder: (context, url) =>
                CircularProgressIndicator(), // Optional placeholder while loading
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: 412),
        Container(
          padding: const EdgeInsets.only(top: 60, left: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/original/${result.posterPath}" ??
                        'no poster photot',
                placeholder: (context, url) =>
                    CircularProgressIndicator(), // Optional placeholder while loading
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
