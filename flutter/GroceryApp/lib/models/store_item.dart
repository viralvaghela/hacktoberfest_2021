import 'package:cloud_firestore/cloud_firestore.dart';

class StoreItem {
  String storeItemID;
  final String name;
  final double price;
  final int quantity;

  StoreItem(this.name, this.price, this.quantity, [this.storeItemID]);

  Map<String, dynamic> toMap() {
    return {"name": name, "price": price, "quantity": quantity};
  }

  factory StoreItem.fromSnapshot(QueryDocumentSnapshot doc) {
    return StoreItem(doc["name"], doc["price"], doc["quantity"], doc.id);
  }
}
