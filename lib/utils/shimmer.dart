import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BuildShimmer extends StatelessWidget {
  const BuildShimmer({super.key});

  @override
  Widget build(BuildContext context) {
     return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 8),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.grey,
            child: Container(
              width: 100, // Adjust the width based on your design
              height: 150, // Adjust the height based on your design
              color: Colors.white,
            ),
          );
        },
        itemCount: 5, // Show 5 shimmer items
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}