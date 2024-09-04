import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:moviesapp/models/watch_list_model.dart';
import 'package:moviesapp/utils/firebase_functions.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    WatchList movie = watchList[index];
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
                                width: 150,
                                height: 200,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left:  0,
                              child: Image.asset(
                                'assets/images/bookmark.png',
                                width: 20,
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                        title: Text(
                          movie.title,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),

                        onTap: () {
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
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.white,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
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