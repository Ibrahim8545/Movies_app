import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:moviesapp/bloc/home_cubit.dart';
import 'package:moviesapp/bloc/states.dart';
import 'package:moviesapp/models/top_section_home_screen_model.dart';
import 'package:moviesapp/utils/api_manager.dart';
import 'package:moviesapp/widget/top_section_items.dart';

class TopSectionListview extends StatelessWidget {
  const TopSectionListview({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) => HomeCubit()..getTopSection(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
             if (state is HomeGetTopSectionLError) {
                context.loaderOverlay.show();
              } else {
                context.loaderOverlay.hide();
              }
      
      
              if (state is HomeGetTopSectionLError) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Something went wrong")));
              }
      
              // if (state is HomeChangeSource) {
              //   HomeCubit.get(context).getNewsData(HomeCubit.get(context)
              //           .model
              //           ?.sources?[HomeCubit.get(context).Selected]
              //           .id ??
              //       "");
              // }
          },
          builder: (context, state) {
            return CarouselSlider.builder(
              itemCount: BlocProvider.of<HomeCubit>(context)
                      .topSectionHomeScreenModel
                      ?.results
                      ?.length ??
                  0,
              itemBuilder: (context, index, pageViewIndex) {
                return TopSectioScreen(
                  result: BlocProvider.of<HomeCubit>(context)
                      .topSectionHomeScreenModel
                      !.results![index],
                );
              },
              options: CarouselOptions(
                height: 250,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(seconds: 2),
              ),
            );
          },
        ),
      ),
    );

    //   FutureBuilder<TopSectionHomeScreenModel>(
    //           future: ApiManger.getTopSection(), // Ensure correct method name
    //           builder: (context, snapshot) {
    //             if (snapshot.connectionState == ConnectionState.waiting) {
    //               return Center(child: CircularProgressIndicator());
    //             } else if (snapshot.hasError) {
    //               return Center(child: Text('Error: ${snapshot.error}'));
    //             } else if (!snapshot.hasData || snapshot.data?.results == null) {
    //               return Center(child: Text('No data available'));
    //             } else {

    // List<Results>  res = [];
    //               res = snapshot.data!.results ?? [];

    //               return CarouselSlider.builder(
    //                 itemCount: res.length,
    //                 itemBuilder: (context, index, pageViewIndex) {
    //                   return TopSectioScreen(
    //                     result: res[index],
    //                   );
    //                 },
    //                 options: CarouselOptions(
    //                   height: 250,
    //                   autoPlay: true,
    //                   viewportFraction: 1,
    //                   autoPlayCurve: Curves.fastOutSlowIn,
    //                   autoPlayAnimationDuration: const Duration(seconds: 2),
    //                 ),
    //               );
    //             }
    //           },
    //         );
  }
}
