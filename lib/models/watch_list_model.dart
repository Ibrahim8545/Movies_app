class WatchList {
  final String id;
  final String title;
  final String posterPath;
  bool isWatchList ;
  final String? releaseDate;

  static const String collectionName = 'watch_list';

  WatchList({
    this.isWatchList=false,
    required this.id,
    required this.title,
    required this.posterPath,
    required this.releaseDate
    
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
