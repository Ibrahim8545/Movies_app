import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/provider/new_reasles_provider.dart';
import 'package:provider/provider.dart';
import 'package:moviesapp/models/new_release_model.dart';
import 'package:moviesapp/models/watch_list_model.dart';
import 'package:moviesapp/screen_details.dart';
import 'package:moviesapp/utils/api_manager.dart';


class ReleaseItem extends StatelessWidget {
  ReleaseItem({required this.movieId, required this.results, Key? key})
      : super(key: key);

  final Results results;
  final int movieId;

  @override
  Widget build(BuildContext context) {
    final watchListProvider = Provider.of<WatchListProvider>(context);
    final isAddedToWatchList = watchListProvider.isMovieInWatchList(movieId.toString());

    return InkWell(
      onTap: () async {
        var movieDetails = await ApiManger.getContent(movieId);
        Navigator.pushNamed(context, ScreenDetails.routeName, arguments: movieDetails);
      },
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: "https://image.tmdb.org/t/p/original/${results.posterPath}" ?? '',
             placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          Positioned(
            top: -1,
            left: -8,
            child: InkWell(
              onTap: () async {
                WatchList watchListDM = WatchList(
                  id: movieId.toString(),
                  title: results.title!,
                  posterPath: results.posterPath!,
                  releaseDate: results.releaseDate!,
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
              child: Container(
                height: 34,
                width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(isAddedToWatchList
                        ? 'assets/images/icondone.png'
                        : 'assets/images/Icon awesome-bookmark.png'),
                    fit: BoxFit.contain,
                  ),
                  color: Colors.transparent,
                ),
                child: Icon(
                  isAddedToWatchList ? Icons.done : Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
