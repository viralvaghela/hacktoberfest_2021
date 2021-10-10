import 'package:flutter/material.dart';

import 'package:grocery_app/view_models/store_item_view_model.dart';

class StoreItemsWidget extends StatelessWidget {
  final List<StoreItemViewModel> storeItems;

  final Function(StoreItemViewModel) onStoreItemDeleted;

  const StoreItemsWidget({
    Key key,
    this.storeItems,
    this.onStoreItemDeleted,
  }) : super(key: key);

  Widget _buildItems(BuildContext context, int index) {
    final storeItem = storeItems[index];
    return Dismissible(
      key: Key(storeItem.storeItemId),
      onDismissed: (_) {
        onStoreItemDeleted(storeItem);
      },
      child: ListTile(
        title: Text(storeItem.name),
      ),
      background: Container(
        color: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: storeItems.length,
      itemBuilder: _buildItems,
    );
  }
}
