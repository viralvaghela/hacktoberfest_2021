import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:wallpaper/pages/full_image_view.dart';
import 'package:wallpaper/services/controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final WallpaperController wallpaperController =
      Get.put(WallpaperController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Wallpaper App'), elevation: 0, centerTitle: true),
      body: Obx(() {
        if (wallpaperController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Scrollbar(
            child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(13),
                      topRight: Radius.circular(13)),
                  child: StaggeredGridView.countBuilder(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      shrinkWrap: true,
                      primary: false,
                      crossAxisCount: 4,
                      itemCount: wallpaperController.imageList.length,
                      staggeredTileBuilder: (i) =>
                          StaggeredTile.count(2, i.isEven ? 2 : 3),
                      crossAxisSpacing: 13,
                      mainAxisSpacing: 13,
                      itemBuilder: (context, i) {
                        return Hero(
                          tag: wallpaperController.imageList[i].heroId,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Material(
                              child: InkWell(
                                  splashColor: Get.theme.primaryColor,
                                  onTap: () {
                                    Get.to(() => ImageViewPage(
                                          selectedWall:
                                              wallpaperController.imageList[i],
                                        ));
                                  },
                                  child: CachedNetworkImage(
                                    filterQuality: FilterQuality.high,
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                    imageUrl: wallpaperController
                                        .imageList[i].compressUrl,
                                    placeholder: (context, url) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    },
                                  )),
                            ),
                          ),
                          // ),
                        );
                      }),
                )),
          );
        }
      }),
    );
  }
}
