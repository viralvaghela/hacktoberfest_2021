import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app/view_models/add_store_view_model.dart';
import 'package:provider/provider.dart';

class AddStorePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  void _saveStore(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      final isSaved = await _addStoreVM.saveStore();
      if (isSaved) {
        Navigator.pop(context);
      }
    }
  }

  AddStoreViewModel _addStoreVM;

  @override
  Widget build(BuildContext context) {
    _addStoreVM = Provider.of<AddStoreViewModel>(context);
    return Scaffold(
        appBar: AppBar(title: Text("Add Store")),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    _addStoreVM.storeName = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter store name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: "Enter store name"),
                ),
                TextFormField(
                  onChanged: (value) {
                    _addStoreVM.storeAddress = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter store address";
                    }
                    return null;
                  },
                  decoration: InputDecoration(hintText: "Enter store address"),
                ),
                ElevatedButton(
                  child: Text("Save", style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    _saveStore(context);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.blue),
                ),
                Spacer(),
                Text(_addStoreVM.message)
              ],
            ),
          ),
        ));
  }
}
