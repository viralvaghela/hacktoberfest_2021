import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/api/model.dart';
import 'package:music_app/services/music_controller.dart';
import 'package:music_app/services/music_data_controller.dart';

// ignore: must_be_immutable
class MusicPlayingPage extends StatelessWidget {
  MusicPlayingPage({Key? key, required this.music}) : super(key: key);
  final Music music;
  bool _initialized = false;
  final MusicService musicService = Get.find();

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      musicService.startPlay(music.musicUrl);
      _initialized = true;
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Now Playing'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.network(
                  music.imageUrl!,
                  fit: BoxFit.cover,
                  height: Get.width - 100 + 100,
                  width: Get.width - 100,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              music.songName!,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              music.artist!,
              style: const TextStyle(fontSize: 15),
            ),
            Obx(() {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Slider(
                        min: 0.0,
                        max: musicService.sliderMax.value,
                        value: musicService.sliderCurrent.value,
                        onChanged: (val) {
                          musicService.seekTo(val);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          musicService.currentDuration.value,
                          style: const TextStyle(fontSize: 20),
                        ),
                        IconButton(
                            iconSize: 40,
                            onPressed: () {
                              musicService.playFromStart();
                            },
                            icon: const Icon(
                              Icons.skip_previous,
                            )),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 35,
                          child: IconButton(
                              iconSize: 40,
                              color: Colors.black,
                              onPressed: () {
                                musicService.playPauseMusic();
                              },
                              icon: Icon(
                                musicService.isPlaying.value
                                    ? Icons.pause_sharp
                                    : Icons.play_arrow,
                              )),
                        ),
                        IconButton(
                            iconSize: 40,
                            onPressed: () {
                              musicService.playFromStart();
                            },
                            icon: const Icon(
                              Icons.skip_next,
                            )),
                        Text(
                          musicService.totalDuration.value,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            })
          ],
        ));
  }
}
