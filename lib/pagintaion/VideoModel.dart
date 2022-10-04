import 'package:video_player/video_player.dart';

class VideoModel {
  int? page;
  int? perPage;
  List<Videos>? videos;
  int? totalResults;
  String? nextPage;
  String? url;

  VideoModel(
      {this.page,
      this.perPage,
      this.videos,
      this.totalResults,
      this.nextPage,
      this.url});

  VideoModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(Videos.fromJson(v));
      });
    }
    totalResults = json['total_results'];
    nextPage = json['next_page'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = perPage;
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    data['total_results'] = totalResults;
    data['next_page'] = nextPage;
    data['url'] = url;
    return data;
  }
}

class Videos {
  int? id;
  int? width;
  int? height;
  int? duration;
  Null? fullRes;
  List<Null>? tags;
  String? url;
  String? image;
  Null? avgColor;
  User? user;
  List<VideoFiles>? videoFiles;
  List<VideoPictures>? videoPictures;
  VideoPlayerController? controller;

  Videos(
      {this.id,
      this.width,
      this.height,
      this.duration,
      this.fullRes,
      this.tags,
      this.url,
      this.image,
      this.avgColor,
      this.user,
      this.videoFiles,
      this.videoPictures,
      this.controller});

  Videos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    duration = json['duration'];
    fullRes = json['full_res'];
    // if (json['tags'] != null) {
    //   tags = <Null>[];
    //   json['tags'].forEach((v) {
    //     tags!.add(Null.fromJson(v));
    //   });
    // }
    url = json['url'];
    image = json['image'];
    avgColor = json['avg_color'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['video_files'] != null) {
      videoFiles = <VideoFiles>[];
      json['video_files'].forEach((v) {
        videoFiles!.add(VideoFiles.fromJson(v));
      });
    }
    if (json['video_pictures'] != null) {
      videoPictures = <VideoPictures>[];
      json['video_pictures'].forEach((v) {
        videoPictures!.add(VideoPictures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['width'] = width;
    data['height'] = height;
    data['duration'] = duration;
    data['full_res'] = fullRes;
    // if (tags != null) {
    //   data['tags'] = tags!.map((v) => v.toJson()).toList();
    // }
    data['url'] = url;
    data['image'] = image;
    data['avg_color'] = avgColor;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (videoFiles != null) {
      data['video_files'] = videoFiles!.map((v) => v.toJson()).toList();
    }
    if (videoPictures != null) {
      data['video_pictures'] = videoPictures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? url;

  User({this.id, this.name, this.url});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class VideoFiles {
  int? id;
  String? quality;
  String? fileType;
  int? width;
  int? height;
  String? link;

  VideoFiles(
      {this.id,
      this.quality,
      this.fileType,
      this.width,
      this.height,
      this.link});

  VideoFiles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quality = json['quality'];
    fileType = json['file_type'];
    width = json['width'];
    height = json['height'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quality'] = quality;
    data['file_type'] = fileType;
    data['width'] = width;
    data['height'] = height;
    data['link'] = link;
    return data;
  }
}

class VideoPictures {
  int? id;
  int? nr;
  String? picture;

  VideoPictures({this.id, this.nr, this.picture});

  VideoPictures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nr = json['nr'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nr'] = nr;
    data['picture'] = picture;
    return data;
  }
}
