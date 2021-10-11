import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  final String name;
  final String address;
  DocumentReference reference;

  Store(this.name, this.address, [this.reference]);

  String get storeId {
    return reference.id;
  }

  Map<String, dynamic> toMap() {
    return {"name": name, "address": address};
  }

  factory Store.fromSnapshot(QueryDocumentSnapshot doc) {
    return Store(doc["name"], doc["address"], doc.reference);
  }
}
