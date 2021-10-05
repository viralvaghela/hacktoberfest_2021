import 'dart:convert';

WallpaperModel wallpaperModelFromJson(String str) => WallpaperModel.fromJson(json.decode(str));

class WallpaperModel {
    WallpaperModel({
      required this.images,
    });

    List<ImageModel> images;

    factory WallpaperModel.fromJson(Map<String, dynamic> json) => WallpaperModel(
        images: List<ImageModel>.from(json["Images"].map((x) => ImageModel.fromJson(x))),
    );
}

class ImageModel {
    ImageModel({
        this.compressUrl,
        this.designer,
        this.downloads,
        this.heroId,
        this.id,
        this.imageUrl,
        this.name,
        this.size,
    });

    String? compressUrl;
    String? designer;
    int? downloads;
    String? heroId;
    int? id;
    String? imageUrl;
    String? name;
    String? size;

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        compressUrl: json["compressUrl"],
        designer: json["designer"],
        downloads: json["downloads"],
        heroId: json["heroID"],
        id: json["id"],
        imageUrl: json["imageUrl"],
        name: json["name"],
        size: json["size"],
    );

}
