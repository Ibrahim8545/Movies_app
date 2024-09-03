import 'package:moviesapp/models/new_recommend_model.dart';

class WatchListDM {
  static const String collectionName = 'watched movies';
  String? id;
  bool? isWatched;
  Results ? result;

  WatchListDM({
    this.id,
    this.isWatched,
    this.result,
  });

  WatchListDM.fromJson(dynamic json) {
    id = json['id'];
    isWatched = json['isWatched'];
    result = json['result'] != null ? Results.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['isWatched'] = isWatched;
    if (result != null) {
      map['result'] = result?.toJson();
    }
    return map;
  }
}