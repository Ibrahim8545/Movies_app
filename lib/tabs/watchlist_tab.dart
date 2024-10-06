import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:moviesapp/models/movie_details_model/movie_details_model.dart';
import 'package:moviesapp/models/new_release_model.dart';
import 'package:moviesapp/models/watch_list_model.dart';
import 'package:moviesapp/screen_details.dart';
import 'package:moviesapp/utils/firebase_functions.dart';

class WatchListTab extends StatelessWidget {
  static const routeName = '/watchlist-tab';
WatchListTab({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    WatchList movie;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WatchList',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: StreamBuilder<List<WatchList>>(
          stream: WatchListDataSource.getWatchedList(),
          builder: (BuildContext context, AsyncSnapshot<List<WatchList>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error?.toString() ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else {
              List<WatchList>? watchList = snapshot.data;
              if (watchList == null || watchList.isEmpty) {
                return const Center(
                  child: Text(
                    'No movies found',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              } else {
                return ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  itemBuilder: (context, index) {
                     movie = watchList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        leading: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: CachedNetworkImage(
                                imageUrl: "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                             
                           
                              ),
                            ),
                          
                          ],
                        ),
                        title: Text(
                          movie.title,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        subtitle: Text(
                          movie.releaseDate??'' ,
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content:
                                const Text('Remove from watchList??'),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Cancel',
                                        style:
                                        TextStyle(color: Colors.black),
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                         movie.isWatchList = false;
                                        WatchListDataSource.deleteMovie(
                                            movie.id.toString());
                                          
                                        Navigator.pop(context);

                                        SnackBar(
                                            content: Text(
                                                '${movie.title} removed from watch list!'));
                                      },
                                      child: Text(
                                        'Remove',
                                        style: TextStyle(color: Colors.red),
                                      )),
                                ],
                              ));
                        },

                        onTap: () {
                          int x=int.parse(movie.id.toString());
                         Navigator.pushNamed(
    context,
    ScreenDetails.routeName,
    arguments:MovieDetailsResponse(
    id: x,
    title: movie.title,
   posterPath: movie.posterPath,
   releaseDate: movie.releaseDate,
  //  runtime: movie.runtime,
  //  voteAverage: movie.voteAverage,
  //  voteCount: movie.voteCount,
    ),
  );
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>Row(
                    mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Icon(
                 Icons.movie,
                  color: Colors.white,
                  
                )),
                Expanded(
                  flex: 3,
                  child: Divider(
                    thickness: 2,
                   
                  ),
                ),
                Expanded(
                    child: Icon(
                  Icons.movie,
                  color: Colors.white,
              
                )),
              ],
                  ),
                 
                  itemCount: watchList.length,
                );
              }
            }
          },
        ),
      ),
    );
  }
}