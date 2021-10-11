import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/models/store_item.dart';
import 'package:grocery_app/view_models/store_item_view_model.dart';
import 'package:grocery_app/view_models/store_view_model.dart';

class StoreItemListViewModel {
  String name;
  double price;
  int quantity;
  final StoreViewModel store;
  StoreItemListViewModel({this.store});

  Stream<QuerySnapshot> get storeItemAsStream {
    return FirebaseFirestore.instance
        .collection("stores")
        .doc(store.storeId)
        .collection("items")
        .snapshots();
  }

  void saveStoreItem() {
    final storeItem = StoreItem(name, price, quantity);
    FirebaseFirestore.instance
        .collection("stores")
        .doc(store.storeId)
        .collection("items")
        .add(storeItem.toMap());
  }

  void deleteStoreItem(StoreItemViewModel storeItem) {
    FirebaseFirestore.instance
        .collection("stores")
        .doc(store.storeId)
        .collection("items")
        .doc(storeItem.storeItemId)
        .delete();
  }
}
