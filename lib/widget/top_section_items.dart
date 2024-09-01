import 'package:flutter/material.dart';
import 'package:moviesapp/models/new_recommend_model.dart';
import 'package:moviesapp/widget/custom_icon_button.dart'; // Ensure this path is correct

class TopSectioScreen extends StatelessWidget {
  final Results result;

  TopSectioScreen({required this.result, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          result.posterPath ?? '', 
          fit: BoxFit.cover, 
          height: 250, 
          width: double.infinity,
        ),
        Container(
          padding: const EdgeInsets.only(top: 60, left: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.network(
                result.posterPath ?? '', 
                fit: BoxFit.cover, 
                height: 150, 
                width: 100,
              ),
              SizedBox(width: 7),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
        CustomIconButton(onPressed: () {})
      ],
    );
  }
}
