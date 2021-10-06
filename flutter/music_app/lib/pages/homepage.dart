import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/pages/music_playing_page.dart';
import 'package:music_app/services/music_controller.dart';
import 'package:music_app/services/music_data_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final MusicController musicController = Get.put(MusicController());
  final MusicService musicService = Get.put(MusicService());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (musicController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: musicController.musicList.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => MusicPlayingPage(
                            music: musicController.musicList[i],
                          ));
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                            musicController.musicList[i].imageUrl)),
                  );
                }),
          );
        }
      }),
    );
  }
}
