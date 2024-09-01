import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchTab extends StatefulWidget {
  @override
  _MovieSearchPageState createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<SearchTab> {
  Map<String, dynamic>? movie;
  bool isLoading = false;


  Future<void> searchMovie(String query) async {
    if (query.isEmpty) {
      setState(() {
        movie = null;
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

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
        if (data['results'].isNotEmpty) {
          movie = data['results'][0];
        } else {
          movie = null;
        }
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load movie');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Search',style: TextStyle(
            color: Colors.white,
            fontSize: 30
        ),),
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
              SizedBox(height: 16.0),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : movie == null
                  ? Container()
                  : Expanded(
                child: Card(
                  color: Colors.grey[900],
                  child: ListTile(
                    leading: movie!['poster_path'] != null
                        ? Image.network('https://image.tmdb.org/t/p/w500/${movie!['poster_path']}')
                        : Container(width: 50, color: Colors.grey),
                    title: Text(
                      movie!['title'],
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      movie!['release_date'] != null
                          ? movie!['release_date'].substring(0, 4)
                          : 'Unknown',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}