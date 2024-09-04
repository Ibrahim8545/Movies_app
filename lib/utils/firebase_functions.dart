import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moviesapp/models/watch_list_model.dart';


class WatchListDataSource {
  static Stream<List<WatchList>> getWatchedList() {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(WatchList.collectionName);

  return collectionReference.snapshots().map((querySnapshot) {
    List<WatchList> watchedList = [];
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
      watchedList.add(WatchList.fromJson(json));
    }
    return watchedList;
  });
}




static Future<void> addMovie(WatchList watchListDM) async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(WatchList.collectionName);
  try {
    await collectionReference.doc(watchListDM.id).set(watchListDM.toJson());
    print("Movie added: ${watchListDM.title}");
  } catch (e) {
    print("Failed to add movie: $e");
  }
}


static Future<void> updateStatus(WatchList watchList) async {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection(WatchList.collectionName);

  // Update the document with the new data
  await collectionReference.doc(watchList.id).update({
    'isWatchList': watchList.isWatchList,
  });
}

}