import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moviesapp/bloc/recommended_cubit.dart/recommended_cubit.dart';
import 'package:moviesapp/bloc/recommended_cubit.dart/state.dart';
import 'package:moviesapp/models/new_release_model.dart';
import 'package:moviesapp/utils/app_color.dart';
import 'package:moviesapp/utils/shimmer.dart';
import 'package:moviesapp/widget/recommended_item.dart';

class RecommenedItemListView extends StatelessWidget {
  const RecommenedItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColor.iconColor,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Recommended',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 5),
          BlocProvider(
            create: (context) => RecommendedCubit()..getRecommendeds(),
            child: BlocConsumer<RecommendedCubit, RecommendedState>(
              listener: (context, state) {
                if (state is RecommendedError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error loading recommendations')),
                  );
                }
              },
              builder: (context, state) {
                if (state is RecommendedLoading) {
                  return BuildShimmer();
                } else if (state is RecommendedSucess) {
                  List<Results> res = BlocProvider.of<RecommendedCubit>(context).newRecommededModel?.results ?? [];
                  
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        return RecommendedItem(
                          results: res[index],
                          movieId: res[index].id!,
                        );
                      },
                      itemCount: res.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                } else {
                  return Center(child: Text('No data available'));
                }
              },
            ),
          ),
        ]),
      ),
      );
  }
}




//  Column(
//           crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Text(
//             'Recommended',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           SizedBox(height: 5),
          
//           FutureBuilder(
//             future: ApiManger.getRecommendeds(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text('Error: ${snapshot.error}'));
//               } else if (!snapshot.hasData || snapshot.data?.results == null) {
//                 return Center(child: Text('No data available'));
//               }
//               List<Results> res = [];
//               res = snapshot.data?.results ?? [];
//               return Expanded(
//                 child: ListView.separated(
//                   separatorBuilder: (context, index) => SizedBox(
//                     width: 8,
//                   ),
//                   itemBuilder: (context, index) {
//                     return RecommendedItem(
//                       results: res[index],
//                       movieId: res[index].id!,
//                     );
//                   },
//                   itemCount: res.length,
//                   scrollDirection: Axis.horizontal,
//                 ),
//               );
//             },
//           ),
//         ]),