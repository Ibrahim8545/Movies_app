import 'package:flutter/material.dart';
import 'package:moviesapp/models/movie_details_model/genre_model.dart';
import 'package:moviesapp/screen_details.dart';
import 'package:moviesapp/utils/api_categry.dart';
import 'package:moviesapp/utils/api_manager.dart';

class GenreDetailPage extends StatefulWidget {
  final Genre genre;

  GenreDetailPage({required this.genre});

  @override
  _GenreDetailPageState createState() => _GenreDetailPageState();
}

class _GenreDetailPageState extends State<GenreDetailPage> {
  late Future<List<Movie>> _movies;

  @override
  void initState() {
    super.initState();
    _movies = ApiService().fetchMoviesByGenre(widget.genre.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          widget.genre.name,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: FutureBuilder<List<Movie>>(
        future: _movies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No movies found for this genre'));
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final movie = snapshot.data![index];
                return InkWell(
                  onTap: () async {
                    var movieDetails = await ApiManger.getContent(movie.id);
                    Navigator.pushNamed(
                      context,
                      ScreenDetails.routeName,
                      arguments: movieDetails,
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            movie.title,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
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
