import 'package:flutter/material.dart';
import 'package:moviesapp/widget/custom_icon_button.dart';

class TopSectionItems extends StatelessWidget {
  const TopSectionItems({super.key});

  @override
  Widget build(BuildContext context) {
    return   Stack(
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
              CustomIconButton(onPressed: () {})
            ],
          );
  }
}