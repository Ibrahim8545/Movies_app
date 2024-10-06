import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({required this.onPressed, super.key});
  void Function()? onPressed;
  int left = 0;
  int top = 0;
  int right = 0;
  int bottom = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 58,
      left: 8,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Icon awesome-bookmark.png'),
              fit: BoxFit.contain),
          // The background color is set to transparent
          color: Colors.transparent,
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
