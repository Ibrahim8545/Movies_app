import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/utils/shimmer.dart';
import 'package:shimmer/shimmer.dart';
import 'package:moviesapp/bloc/new_realse_cubit.dart/new_realse_cubit.dart';
import 'package:moviesapp/bloc/new_realse_cubit.dart/new_realse_states.dart';
import 'package:moviesapp/utils/app_color.dart';
import 'package:moviesapp/widget/realse_item.dart';

class NewRealseItem extends StatelessWidget {
  const NewRealseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.iconColor,
      height: 187,
      padding: EdgeInsets.all(8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'New Releases',
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 5),
        BlocProvider(
          create: (context) => NewRealseCubit()..getNewReleases(),
          child: BlocConsumer<NewRealseCubit, HomeNewRealseState>(
            listener: (context, state) {
              if (state is HomeGetNewRealseError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error')),
                );
              }
            },
            builder: (context, state) 
            {
              if (state is HomeGetNewRealseLoading) {
                return BuildShimmer();
              } else if (state is HomeGetNewRealseSucess) {
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      return ReleaseItem(
                        results: BlocProvider.of<NewRealseCubit>(context)
                            .newRealseModel!
                            .results![index],
                        movieId: BlocProvider.of<NewRealseCubit>(context)
                            .newRealseModel!
                            .results![index]
                            .id!,
                      );
                    },
                    itemCount: BlocProvider.of<NewRealseCubit>(context)
                        .newRealseModel!
                        .results!
                        .length,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              } else if (state is HomeGetNewRealseError) {
                return Center(child: Text('Error: ${state}'));
              } else {
                return Center(child: Text('No data available'));
              }
            },
          ),
        )
      ]),
    );
  }

 
}
