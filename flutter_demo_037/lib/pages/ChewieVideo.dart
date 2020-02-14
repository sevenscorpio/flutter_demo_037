import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoDemoPage extends StatefulWidget {
  @override
  _VideoDemoPageState createState() => _VideoDemoPageState();
}

class _VideoDemoPageState extends State<VideoDemoPage> {

  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    videoPlayerController = VideoPlayerController.network("http://vfx.mtime.cn/Video/2019/02/04/mp4/190204084208765161.mp4");

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3/2,
      autoPlay: true,
      looping: true,
    );

  }

  // 销毁
  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController.dispose();

    chewieController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("video demo")
      ),
      body: Column(

        children: <Widget>[

          Expanded(
            child: Chewie(
              controller: chewieController,
              
            ),
          ),
        ],
      ),
    );
  }
}