import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/models/movie_details_model/movie_details_model.dart';
import 'package:moviesapp/models/new_release_model.dart';
import 'package:moviesapp/utils/api_manager.dart';
import 'package:moviesapp/utils/app_color.dart';
import 'package:moviesapp/utils/styles.dart';
import 'package:moviesapp/widget/more_like_this.dart';
import 'package:moviesapp/widget/type_of_film_container.dart';

class ScreenDetails extends StatelessWidget {
  static const routeName = '/screen_details';
  ScreenDetails({super.key, required movie});

  @override
  Widget build(BuildContext context) {
    final movieDetails =
        ModalRoute.of(context)!.settings.arguments as MovieDetailsResponse;
    //var modal=ModalRoute.of(context)!.settings.arguments as Results;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.white, size: 30),
          backgroundColor: AppColor.iconColor,
          title: Text(
            movieDetails.title ?? '',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            CachedNetworkImage(
                imageUrl:
                    "https://image.tmdb.org/t/p/original/${movieDetails.backdropPath}" ??
                        '',
                        placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Image.asset('assets/images/nophoto.png'),
                width: 412),
            Container(
              padding: EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieDetails.originalTitle ?? '',
                    style: Styles.textStyle18,
                  ),
                  Text(
                    movieDetails.releaseDate ?? '',
                    style:
                        Styles.textStyle14.copyWith(color: Color(0xffB5B4B4)),
                  ),
                  SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            "https://image.tmdb.org/t/p/original/${movieDetails.posterPath}" ??
                                '',
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Image.asset('assets/images/nophoto.png'),
                        height: 160,
                      ),
                      SizedBox(width: 10), // Add spacing between image and text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 5.0, // Horizontal space between children
                              runSpacing: 5.0,

                              children: [
                                TypeOfFilm(
                                    text: movieDetails.genres![0].name ?? ''),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              movieDetails.overview ?? '',
                              maxLines: 3,
                              style: Styles.textStyle14.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                              textAlign: TextAlign
                                  .justify, // Optional: Align text justify
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 15,
                                ),
                                Text(
                                  movieDetails.voteAverage.toString(),
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: AppColor.iconColor,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'More Like this',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5),
                      FutureBuilder(
                          future:
                              ApiManger.getMoreLikeThisList(movieDetails.id!),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else if (!snapshot.hasData ||
                                snapshot.data?.results == null) {
                              return Center(child: Text('No data available'));
                            }
                            List<Results> res = [];
                            res = snapshot.data?.results ?? [];
                            return Expanded(
                              child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 8,
                                ),
                                itemBuilder: (context, index) {
                                  return MoreLikeTHisList(
                                    results: res[index],
                                    movieId: res[index].id!,
                                  );
                                },
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                              ),
                            );
                          })
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
