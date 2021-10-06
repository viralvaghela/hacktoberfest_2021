import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class MusicService extends GetxController {
  AudioPlayer? player;
  //Duration fields
  var isPlaying = false.obs;
  var totalDuration = '0:00'.obs;
  var currentDuration = '0:00'.obs;

  //Slider values
  var sliderMax = 0.0.obs;
  var sliderCurrent = 0.0.obs;

  @override
  onInit() {
    player = AudioPlayer();
    super.onInit();
    // startPlay();
    updateCurrentPosition();
  }

  //Load Music
  startPlay(String? url) async {
    try {
      await player!.setUrl(url!, preload: false);
      await player!.load();
      updateMaxPosition();
    } on PlayerException catch (e) {
      throw Exception(e);
    } on PlayerInterruptedException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  //Play or pause music
  playPauseMusic() {
    isPlaying.value = !player!.playing;
    player!.playing ? player!.pause() : player!.play();
  }

  //Play from start
  playFromStart() {
    player!.seek(Duration.zero);
  }

  //Seek to desired position
  seekTo(double dur) {
    player!.seek(Duration(seconds: dur.toInt()));
  }

  //update max position once
  updateMaxPosition() {
    totalDuration.value = player!.duration!.inMinutes.toString() +
        ':' +
        (player!.duration!.inSeconds % 60).toString().padLeft(2, '0');

    sliderMax.value = player!.duration!.inSeconds.toDouble();
  }

  //listen current position from stream
  updateCurrentPosition() {
    player!.positionStream.listen((position) {
      currentDuration.value = position.inMinutes.toString() +
          ':' +
          (position.inSeconds % 60).toString().padLeft(2, '0');
      sliderCurrent.value = position.inSeconds.toDouble();
    });
  }
}
