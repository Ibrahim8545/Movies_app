import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/models/new_release_model.dart';
import 'package:moviesapp/models/watch_list_model.dart';
import 'package:moviesapp/screen_details.dart';
import 'package:moviesapp/utils/api_manager.dart';
import 'package:moviesapp/utils/firebase_functions.dart';

class ReleaseItem extends StatefulWidget {
  ReleaseItem({required this.movieId, required this.results, super.key});
  Results results;
  final int movieId;

  @override
  State<ReleaseItem> createState() => _ReleaseItemState();
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
            left: -6,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: isAddedToWatchList? AssetImage('assets/images/icondone.png'):  AssetImage('assets/images/Icon awesome-bookmark.png'),
                  fit: BoxFit.contain,
                ),
                color: Colors.transparent,
              ),
              child: IconButton(
                onPressed: () async 
                {
                  try {
                     WatchList watchListDM= WatchList(
                      id: widget.movieId
                          .toString(), 
                      title: widget.results.title!,
                      posterPath: widget.results.posterPath!,
                    );
                  

                    await WatchListDataSource.addMovie(watchListDM).then((value) {
                      watchListDM.isWatchList = true;
                      WatchListDataSource.updateStatus(watchListDM);
                      isAddedToWatchList = true;
                      setState(() {
                        
                      });
                      

                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('${widget.results.title} added to watch list!')),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to add movie: $e')),
                    );
                  }
                },
                icon: Icon(
                 isAddedToWatchList ? Icons.done:
                  Icons.add,
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
