import 'dart:io';

import 'package:mime/mime.dart';

class GetFileList {
  static List<String> images = [];
  static List<String> videos = [];

  static Future<void> getFilesList() async {
    Directory dir = Directory("storage/emulated/0/WhatsApp/Media/.Statuses");
    images.clear();
    videos.clear();
    await dir.list(recursive: false).forEach((f) {
      if (f is File) {
        if (isImage(f.path)) {
          images.add(f.path);
        } else if (isVideo(f.path)) {
          videos.add(f.path);
        }
      }
    });
  }

  static bool isImage(String path) {
    final mimeType = lookupMimeType(path);

    if (mimeType != null) {
      try {
        return mimeType.startsWith('image/');
      } catch (e) {
        print(e);
        return false;
      }
    } else {
      return false;
    }
  }

  static bool isVideo(String path) {
    final mimeType = lookupMimeType(path);
    if (mimeType != null) {
      try {
        return mimeType.startsWith('video/');
      } catch (e) {
        print(e);
        return false;
      }
    } else {
      return false;
    }
  }
}
