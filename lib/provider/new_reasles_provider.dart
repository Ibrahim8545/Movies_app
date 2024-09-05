import 'package:flutter/material.dart';
import 'package:moviesapp/models/watch_list_model.dart';
import 'package:moviesapp/utils/firebase_functions.dart';

class WatchListProvider extends ChangeNotifier {
  final List<WatchList> _watchList = [];

  List<WatchList> get watchList => _watchList;

  bool isMovieInWatchList(String movieId) {
    return _watchList.any((item) => item.id == movieId);
  }

  Future<void> addMovie(WatchList movie) async {
    try {
      await WatchListDataSource.addMovie(movie);
      _watchList.add(movie);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to add movie to watch list');
    }
  }

  Future<void> removeMovie(WatchList movie) async {
    try {
      await WatchListDataSource.deleteMovie(movie.id);
      _watchList.removeWhere((item) => item.id == movie.id);
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to remove movie from watch list');
    }
  }
}
