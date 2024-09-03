import 'package:flutter/material.dart';
import 'package:moviesapp/categry_details.dart';
import 'package:moviesapp/models/movie_details_model/genre_model.dart';
import 'package:moviesapp/utils/api_categry.dart';


class BrowserTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Browse ',style: TextStyle(
         color: Colors.white,
         fontSize: 30

        ),),
      ),
      body: FutureBuilder<List<Genre>>(
        future: ApiService().fetchGenres(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No categories found'));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final genre = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenreDetailPage(genre: genre,),
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        'assets/images/0e34a5e080e8c915030603ddcdb4eeba.png',
                       height: 500,
                          width: 200,
                      ),
                      Container(
                        color: Colors.black54,
                        child: Text(
                          genre.name,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}