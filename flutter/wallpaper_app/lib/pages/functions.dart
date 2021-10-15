import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:request_permission/request_permission.dart';
import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wc_flutter_share/wc_flutter_share.dart';

class DownloadImage {
  static Future downloadImage(String url, String name, String unique) async {
    getPermission();
    try {
      Dio dio = Dio();
      Directory('storage/emulated/0/BuffyWalls')
          .create(recursive: true)
          .then((Directory directory) async {
        await dio
            .download(url, '${directory.path}/$name $unique.jpg')
            .then((s) {
          Get.snackbar('Wallpaper', 'downloaded successfully',
              backgroundColor: Colors.white);
        });
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  static getPermission() async {
    RequestPermission.instace
        .requestAndroidPermission('android.permission.WRITE_EXTERNAL_STORAGE');
  }
}

setWallDialog(String url) {
  Get.defaultDialog(
    title: 'Set Wallpaper',
    content: Column(
      children: [
        ListTile(
          title: const Text(
            'Homescreen',
            style: TextStyle(fontSize: 17),
          ),
          onTap: () {
            setHomeWall(url);
            Get.back();
          },
        ),
        ListTile(
          title: const Text(
            'Lockscreen',
            style: TextStyle(fontSize: 17),
          ),
          onTap: () {
            setLockWall(url);
            Get.back();
          },
        ),
        ListTile(
          title: const Text(
            'Both',
            style: TextStyle(fontSize: 17),
          ),
          onTap: () {
            setBothWall(url);
            Get.back();
          },
        )
      ],
    ),
  );
}

//To set Walls in Home
Future<void> setHomeWall(String url) async {
  int location = WallpaperManagerFlutter.HOME_SCREEN;
  var file = await DefaultCacheManager().getSingleFile(url);
  WallpaperManagerFlutter().setwallpaperfromFile(file, location);
  Get.snackbar('Wallpaper', 'set successfully', backgroundColor: Colors.white);
}

//To set Walls in LOCK
Future<void> setLockWall(String url) async {
  int location = WallpaperManagerFlutter.LOCK_SCREEN;
  var file = await DefaultCacheManager().getSingleFile(url);
  WallpaperManagerFlutter().setwallpaperfromFile(file, location);
  Get.snackbar('Wallpaper', 'set successfully', backgroundColor: Colors.white);
}

//To set Walls in BOTH
Future<void> setBothWall(String url) async {
  int location = WallpaperManagerFlutter.BOTH_SCREENS;
  var file = await DefaultCacheManager().getSingleFile(url);
  WallpaperManagerFlutter().setwallpaperfromFile(file, location);
  Get.snackbar('Wallpaper', 'set successfully', backgroundColor: Colors.white);
}

shareImage(String url) async {
  try {
    WcFlutterShare.share(
        sharePopupTitle: 'Share this Awesome Image to Your Friends',
        subject: 'Share it',
        text: 'Wallpaper \n' + url,
        mimeType: 'text/plain');
  } catch (e) {
    throw Exception(e);
  }
}
