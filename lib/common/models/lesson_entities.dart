class LessonRequestEntity {
  int? id;

  LessonRequestEntity({
    this.id,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class LessonListResponseEntity {
  int? code;
  String? msg;
  List<LessonItem>? data;

  LessonListResponseEntity({
    this.code,
    this.data,
    this.msg,
  });

  factory LessonListResponseEntity.fromJson(Map<String, dynamic> json) =>
      LessonListResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<LessonItem>.from(
                json["data"].map((x) => LessonItem.fromJson(x))),
      );
}

class LessonDetailResponseEntity {
  int? code;
  String? msg;
  List<LessonVideoItem>? data;

  LessonDetailResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory LessonDetailResponseEntity.fromJson(Map<String, dynamic> json) =>
      LessonDetailResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<LessonVideoItem>.from(
                json["data"].map((x) => LessonVideoItem.fromJson(x))),
      );
}

class LessonItem {
  String? name;
  String? description;
  String? thumbnail;
  int? id;

  LessonItem({
    this.name,
    this.description,
    this.thumbnail,
    this.id,
  });

  factory LessonItem.fromJson(Map<String, dynamic> json) => LessonItem(
        name: json["name"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "thumbnail": thumbnail,
        "id": id,
      };
}

// login result
class LessonVideoItem {
  String? name;
  String? url;
  String? thumbnail;

  LessonVideoItem({
    this.url,
    this.name,
    this.thumbnail,
  });
  factory LessonVideoItem.fromJson(Map<String, dynamic> json) =>
      LessonVideoItem(
        url: json["url"],
        name: json["name"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "thumbnail": thumbnail,
      };
}

class LessonVideo {
  final List<LessonVideoItem> lessonItem;
  final Future<void>? initializeVideoPlayer;
  final bool isplay;
  final String? url;

  LessonVideo({
    this.lessonItem = const <LessonVideoItem>[],
    this.initializeVideoPlayer,
    this.isplay = false,
    this.url = "",
  });

  LessonVideo copyWith({
    List<LessonVideoItem>? lessonItem,
    Future<void>? initializeVideoPlayer,
    bool? isPlay,
    String? url,
  }) {
    return LessonVideo(
      lessonItem: lessonItem ?? this.lessonItem,
      initializeVideoPlayer:
          initializeVideoPlayer ?? this.initializeVideoPlayer,
      isplay: isplay ?? this.isplay,
      url: url ?? this.url,
    );
  }
}
