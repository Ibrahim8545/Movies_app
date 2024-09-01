import 'package:flutter/material.dart';
import 'package:moviesapp/utils/styles.dart';

class TypeOfFilm extends StatelessWidget {
  TypeOfFilm({required this.text, super.key});
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffB5B4B4),
          width: 2,
        ),
      ),
      child: Text(
        text,
        style: Styles.textStyle14,
      ),
    );
  }
}
