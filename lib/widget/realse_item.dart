import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/models/new_release_model.dart';
import 'package:moviesapp/models/watch_list_model.dart';
import 'package:moviesapp/screen_details.dart';
import 'package:moviesapp/utils/api_manager.dart';
import 'package:moviesapp/utils/firebase_functions.dart';

class ReleaseItem extends StatefulWidget {
  ReleaseItem({required this.movieId, required this.results, Key? key})
      : super(key: key);

  final Results results;
  final int movieId;

  @override
  _ReleaseItemState createState() => _ReleaseItemState();
}

class _ReleaseItemState extends State<ReleaseItem> {
  bool isAddedToWatchList = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var movieDetails = await ApiManger.getContent(widget.movieId);
        Navigator.pushNamed(context, ScreenDetails.routeName,
            arguments: movieDetails);
      },
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://image.tmdb.org/t/p/original/${widget.results.posterPath}" ??
                    '',
          ),
          Positioned(
            top: -1,
            left: -8,
            child: InkWell(
              onTap: () async {
                WatchList watchListDM = WatchList(
                  id: widget.movieId.toString(),
                  title: widget.results.title!,
                  posterPath: widget.results.posterPath!,
                );
                try {
                  if (isAddedToWatchList) {
                    // Remove from watch list
                    //await WatchListDataSource.removeMovie(watchListDM);
                    setState(() {
                      isAddedToWatchList = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              '${widget.results.title} removed from watch list!')),
                    );
                  } else {
                    // Add to watch list
                    await WatchListDataSource.addMovie(watchListDM)
                        .then((value) {
                      watchListDM.isWatchList = true;
                      WatchListDataSource.updateStatus(watchListDM);
                    });
                    setState(() {
                      isAddedToWatchList = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              '${widget.results.title} added to watch list!')),
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
          )
        ],
      ),
    );
  }
}
