import 'package:moviesapp/models/movie_details_model/generes_model.dart';

class WatchList {
  final String id;
  final String title;
  final String posterPath;
  bool isWatchList ;
  String? releaseDate;
  //   double? voteAverage;
  // int? voteCount;
  //  List<Genres>? genres;
  //  String? backdropPath;

  static const String collectionName = 'watch_list';

  WatchList({
    this.isWatchList=false,
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    // required this voteAverage,
    // required this.voteCount,
    // required this.genres,
    // required this.backdropPath
    
  });

  factory WatchList.fromJson(Map<String, dynamic> json) {
    return WatchList(
      id: json['id'],
      title: json['title'],
      posterPath: json['posterPath'],
      isWatchList: json['isWatchList'],
      releaseDate: json['releaseDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'posterPath': posterPath,
      'isWatchList': isWatchList,
      'releaseDate': releaseDate
    };
  }
}
