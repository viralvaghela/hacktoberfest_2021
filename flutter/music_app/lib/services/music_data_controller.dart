import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:music_app/api/model.dart';

class MusicController extends GetxController{
  var isLoading = true.obs;

  List <dynamic> musicList = [].obs;
  @override
  onInit() {
    fetchDataFromLocal();
    super.onInit();
  }

  
  Future<String> getJson() {
    return rootBundle.loadString('assets/db.json');
  }

  Future fetchDataFromLocal() async {
    isLoading(true);
    try {
      var list = MusicModel.fromJson(json.decode(await getJson()));
      musicList = list.music;

      // imageList
      //   ..sort((a, b) =>
      //       int.parse(b.id.toString()).compareTo(int.parse(a.id.toString())));
    } on Exception catch (e) {
      throw Exception(e);
    } finally {
      isLoading(false);
    }
  }
}