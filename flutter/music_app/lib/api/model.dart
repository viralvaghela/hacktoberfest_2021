
import 'dart:convert';

MusicModel musicModelFromJson(String str) => MusicModel.fromJson(json.decode(str));

class MusicModel {
    MusicModel({
        required this.music,
    });

    List<Music> music;

    factory MusicModel.fromJson(Map<String, dynamic> json) => MusicModel(
        music: List<Music>.from(json["Music"].map((x) => Music.fromJson(x))),
    );

}

class Music {
    Music({
        this.imageUrl,
        this.artist,
        this.songName,
        this.musicUrl,
        this.id,
    });

    String? imageUrl;
    String? artist;
    String? songName;
    String? musicUrl;
    int? id;

    factory Music.fromJson(Map<String, dynamic> json) => Music(
        imageUrl: json["imageUrl"],
        artist: json["artist"],
        songName: json["songName"],
        musicUrl: json["musicUrl"],
        id: json["id"],
    );

}
