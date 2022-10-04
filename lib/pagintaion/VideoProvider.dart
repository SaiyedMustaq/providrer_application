import 'package:flutter/cupertino.dart';

import '../network/NetworkCall.dart';
import 'VideoModel.dart';

class VideoProvider extends ChangeNotifier {
  int _page = 1;
  int get page => _page;
  bool isLoading = true;

  set page(int value) {
    _page = value;
    notifyListeners();
  }

  List<Videos> _video = <Videos>[];
  List<Videos> get videos => _video;

  set videos(List<Videos> values) {
    _video = values;
  }

  Future<void> callViedeoApi() async {
    await NetworkCall().getVideos(_page, 'nature').then((response) {
      _page = _page + 1;

      addVideoToList(VideoModel.fromJson(response).videos);
    });
    notifyListeners();
  }

  void addVideoToList(List<Videos>? videos) {
    // for (var itme in videos!) {
    //   itme.controller =
    //       VideoPlayerController.network(itme.videoFiles![0].link!);
    // }
    _video.addAll(videos!);
    isLoading = false;
    notifyListeners();
  }
}
