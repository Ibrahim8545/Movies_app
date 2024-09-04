import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviesapp/tabs/home_tabs.dart';
import 'package:moviesapp/utils/firebase_functions.dart';
// Import WatchListDataSource
import 'package:moviesapp/models/watch_list_model.dart'; // Import WatchListDM model

class WatchListTab extends StatelessWidget {
  const WatchListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              return Expanded(
                child: Center(
                  child: Text(
                    snapshot.error?.toString() ?? "",
                  ),
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
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      WatchList movie = watchList[index];
                      return ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        leading: CachedNetworkImage(
                          imageUrl: "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                        title: Text(
                          movie.title,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        
                       
                        onTap: () {
                   
                        },
                      );
                    },
                    itemCount: watchList.length,
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
