import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviesapp/bloc/new_realse_cubit.dart/new_realse_cubit.dart';
import 'package:moviesapp/bloc/new_realse_cubit.dart/new_realse_states.dart';
import 'package:moviesapp/bloc/top_section_cubit/home_cubit.dart';
import 'package:moviesapp/models/new_release_model.dart';
import 'package:moviesapp/screen_details.dart';
import 'package:moviesapp/utils/api_manager.dart';
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
        SizedBox(
          height: 5,
        ),
        BlocProvider(
          create: (context) =>NewRealseCubit()..getNewReleases(),
          child: BlocConsumer<NewRealseCubit,HomeNewRealseState>(
              listener: (context, state) {
              
            },
            builder: (context, state) {
                      return  Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: 8,
              ),
              itemBuilder: (context, index) {
                return ReleaseItem(
                  results:BlocProvider.of<NewRealseCubit>(context).newRealseModel?.results?[index]??Results(),
                  movieId:BlocProvider.of<NewRealseCubit>(context).newRealseModel!.results![index].id!,
        
                );
              },
              itemCount:BlocProvider.of<NewRealseCubit>(context).newRealseModel?.results?.length??0,
              scrollDirection: Axis.horizontal,
            ),
          );
    
            }, 
          ),
        )
      ]),
    );
  }
}

//  FutureBuilder(
//           future: ApiManger.getNewReleases(),
          
//           builder: (context, snapshot) {
//             List<Results> res = [];
            //  if (snapshot.connectionState == ConnectionState.waiting) {
            //   return Center(child: CircularProgressIndicator());
            // } else if (snapshot.hasError) {
            //   return Center(child: Text('Error: ${snapshot.error}'));
            // } else if (!snapshot.hasData || snapshot.data?.results == null) {
            //   return Center(child: Text('No data available'));
            // } 
//               res = snapshot.data?.results ?? [];
          //   return  Expanded(
          //   child: ListView.separated(
          //     separatorBuilder: (context, index) => SizedBox(
          //       width: 8,
          //     ),
          //     itemBuilder: (context, index) {
          //       return ReleaseItem(
          //         results: res[index],
          //         movieId: res[index].id!,
        
          //       );
          //     },
          //     itemCount:res.length,
          //     scrollDirection: Axis.horizontal,
          //   ),
          // );
          // },
         
//         ),