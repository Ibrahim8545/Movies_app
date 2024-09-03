// lib/api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviesapp/models/movie_details_model/genre_model.dart';


class ApiService {
  final String _baseUrl = "https://api.themoviedb.org/3";
  final String _apiKey = "c090e316f95f6ded0c7c53ce03afd5d0";

  Future<List<Genre>> fetchGenres() async {
    final response = await http.get(Uri.parse("$_baseUrl/genre/movie/list?api_key=$_apiKey"));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> genresList = data['genres'];
      return genresList.map((json) => Genre.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load genres');
    }
  }

  Future<List<Movie>> fetchMoviesByGenre(int genreId) async {
    final response = await http.get(Uri.parse("$_baseUrl/discover/movie?api_key=$_apiKey&with_genres=$genreId"));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> moviesList = data['results'];
      return moviesList.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}

class Movie {
  final int id;
  final String title;
  final String posterPath;

  Movie({required this.id, required this.title, required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'] ?? '',
    );
  }
}