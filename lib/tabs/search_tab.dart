import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:moviesapp/screen_details.dart';
import 'package:moviesapp/utils/api_manager.dart';

class SearchTab extends StatefulWidget {
  @override
  _MovieSearchPageState createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<SearchTab> {
  List<dynamic> movies = [];
  bool isLoading = false;
  String errorMessage = '';

  Future<void> searchMovie(String query) async {
    if (query.isEmpty) {
      setState(() {
        movies = [];
        errorMessage = '';
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      Uri url = Uri.https(
        'api.themoviedb.org',
        '/3/search/movie',
        {
          'api_key': 'c090e316f95f6ded0c7c53ce03afd5d0',
          'query': query,
        },
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          movies = data['results'];
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to load movies';
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'An error occurred';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Search',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search for a movie...',
                  hintStyle: TextStyle(color: Colors.white54),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (query) {
                  searchMovie(query);
                },
              ),
              SizedBox(height: 16),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : errorMessage.isNotEmpty
                      ? Center(
                          child: Text(
                            errorMessage,
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : Expanded(
                          child: movies.isEmpty
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          'assets/images/Icon material-local-movies.png'),
                                      Text(
                                        'No movies found',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: movies.length,
                                  itemBuilder: (context, index) {
                                    final movie = movies[index];
                                    return Card(
                                      color: Colors.grey[900],
                                      child: InkWell(
                                        onTap: () async {
                                          var movieDetails = await ApiManger.getContent(movie['id']);
                                          Navigator.pushNamed(
                                            context,
                                            ScreenDetails.routeName,
                                            arguments: movieDetails,
                                          );
                                        },
                                        child: ListTile(
                                          leading: movie['poster_path'] != null
                                              ? Image.network(
                                                  'https://image.tmdb.org/t/p/w500/${movie['poster_path']}')
                                              : Container(
                                                  width: 50,
                                                  color: Colors.grey,
                                                ),
                                          title: Text(
                                            movie['title'] ?? 'Unknown title',
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
