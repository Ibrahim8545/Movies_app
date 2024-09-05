import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/models/new_release_model.dart';
import 'package:moviesapp/models/watch_list_model.dart';
import 'package:moviesapp/provider/new_reasles_provider.dart';
import 'package:moviesapp/screen_details.dart';
import 'package:moviesapp/utils/api_manager.dart';
import 'package:provider/provider.dart';

class MoreLikeTHisList extends StatelessWidget {
  static const routeName = '/more_like_this';
  MoreLikeTHisList({required this.movieId ,required this.results,super.key});
Results results;
final int movieId;

  @override
  Widget build(BuildContext context) {
        final watchListProvider = Provider.of<WatchListProvider>(context);
    final isAddedToWatchList = watchListProvider.isMovieInWatchList(movieId.toString());
    return InkWell(
         onTap: ()async {
          var movieDetails = await ApiManger.getContent(movieId);
          Navigator.pushReplacementNamed(context, ScreenDetails.routeName,arguments: movieDetails);
        },
      child: Container(
        width: 96.87,
        color: Color(0xff343534),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Stack(
      
        children: [
           CachedNetworkImage(
                    imageUrl:
                        "https://image.tmdb.org/t/p/original/${results.posterPath}" ??
                            '',
                   ),
          Positioned(
            top: -1,
            left: -6,
            child: Container(
      
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(isAddedToWatchList
                        ? 'assets/images/icondone.png'
                        : 'assets/images/Icon awesome-bookmark.png'),
                    fit: BoxFit.contain,),  
               
                color: Colors.transparent,
              ),
              child: IconButton(
                onPressed: ()async 
                {
                    WatchList watchListDM = WatchList(
                  id: movieId.toString(),
                  title: results.title!,
                  posterPath: results.posterPath!,
                );

                try {
                  if (isAddedToWatchList) {
                    await watchListProvider.removeMovie(watchListDM);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${results.title} removed from watch list!')),
                    );
                  } else {
                    await watchListProvider.addMovie(watchListDM);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${results.title} added to watch list!')),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to update watch list: $e')),
                  );
                }
                },
                icon: Icon(
                  isAddedToWatchList ? Icons.done : Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 10,
                  ),
                  Text(
                    results.voteAverage.toString(),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
           Padding(
             padding: const EdgeInsets.only(
              left: 8,
              right: 8
             ),
             child: Column(
              children: [
                 Text(
                results.title??'',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
              Text(
                results.releaseDate??'',
                style: TextStyle(
                  color: Color(0xffB5B4B4),
                  fontSize: 8,
                ),
              ),
              ],
             ),
           ),
            
          ],
        ),
      ),
    );
  }
}