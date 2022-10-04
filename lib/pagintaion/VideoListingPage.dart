import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import 'VideoProvider.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({Key? key}) : super(key: key);

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  final ScrollController _scrollController = ScrollController();

  fetchData() async {
    Provider.of<VideoProvider>(context, listen: false).callViedeoApi();
  }

  @override
  void initState() {
    fetchData();
    super.initState();
    _scrollController.addListener(_scrollListner);
  }

  void _scrollListner() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<VideoProvider>(
        builder: (context, videoData, child) => ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: videoData.videos.length,
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (index == videoData.videos.length - 1) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return videoData.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height * .9,
                    //child: Image.network(videoData.videos[index].image!),
                    child: Chewie(
                      controller: ChewieController(
                          aspectRatio: 3 / 5,
                          autoPlay: true,
                          allowMuting: false,
                          placeholder: const AspectRatio(
                            aspectRatio: 3 / 5,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                            // child: Image.network(
                            //     '${videoData.videos[index].videoPictures![0].picture}'),
                          ),
                          overlay: const Text('data'),
                          showControlsOnInitialize: false,
                          videoPlayerController: VideoPlayerController.network(
                            '${videoData.videos[index].videoFiles![0].link}',
                          )),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
