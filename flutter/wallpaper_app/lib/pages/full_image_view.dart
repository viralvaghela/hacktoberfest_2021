import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/api/model.dart';
import 'package:wallpaper/pages/functions.dart';
import 'package:wallpaper/services/controller.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

class ImageViewPage extends StatelessWidget {
  ImageViewPage({Key? key, this.selectedWall}) : super(key: key);
  final ImageModel? selectedWall;
  final WallpaperController wallpaperController =
      Get.find<WallpaperController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Hero(
            tag: selectedWall!.heroId!,
            child: ZoomOverlay(
              minScale: 0.5, // Optional
              maxScale: 3.0, // Optional
              twoTouchOnly: true,
              child: CachedNetworkImage(
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  filterQuality: FilterQuality.high,
                  width: Get.width,
                  height: Get.height,
                  fit: BoxFit.cover,
                  imageUrl: selectedWall!.imageUrl!,
                  placeholder: (context, url) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ),
          Positioned(
            left: 5,
            top: 5,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: IconButton(
                    splashColor: Get.theme.primaryColor,
                    color: Colors.white,
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 27,
                    ),
                    onPressed: () {
                      Get.back();
                    }),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: IconButton(
                            icon: const Icon(Icons.image, color: Colors.white),
                            onPressed: () {
                              setWallDialog(selectedWall!.imageUrl!);
                            }),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: IconButton(
                            icon:
                                const Icon(Icons.download, color: Colors.white),
                            onPressed: () {
                              DownloadImage.downloadImage(
                                  selectedWall!.imageUrl!,
                                  selectedWall!.name!,
                                  selectedWall!.heroId!);
                            }),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: IconButton(
                            icon: const Icon(Icons.share, color: Colors.white),
                            onPressed: () {
                              shareImage(selectedWall!.imageUrl!);
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
