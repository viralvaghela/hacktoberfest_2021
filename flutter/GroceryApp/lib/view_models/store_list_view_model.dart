import 'package:cloud_firestore/cloud_firestore.dart';

class StoreListViewModel {
  Stream<QuerySnapshot> get storesAsStream {
    return FirebaseFirestore.instance.collection("stores").snapshots();
  }
}
