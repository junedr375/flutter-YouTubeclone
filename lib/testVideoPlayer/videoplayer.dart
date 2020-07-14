import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cognent/testVideoPlayer/videoitem.dart';
import 'package:http/http.dart';
import 'package:video_player/video_player.dart';
import 'package:m3u/m3u.dart';
// import 'package:media_notification_control/media_notification.dart';
import 'package:flutter_media_notification/flutter_media_notification.dart';
import 'package:connectivity/connectivity.dart';
import 'package:wakelock/wakelock.dart';

//import 'hlsvideoplayer.dart';
import 'package:cognent/testVideoPlayer/hlsvideoplayer.dart';



class VideoContainer extends StatefulWidget {
 
  final String playlistUrl;
  VideoContainer(this.playlistUrl);
  List res = [];
  List linkRes = [];

  @override
  _VideoContainerState createState() => _VideoContainerState();
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  LifecycleEventHandler(
      {this.resumeCallBack, this.suspendingCallBack, this.detachedCallBack});

  final AsyncCallback resumeCallBack;
  final AsyncCallback suspendingCallBack;
  final AsyncCallback detachedCallBack;

  @override
  Future<Null> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.inactive:
        await suspendingCallBack();
        print("inactive");
        break;
      case AppLifecycleState.paused:
        await suspendingCallBack();
        print("paused");
        break;
      case AppLifecycleState.detached:
        print("detached");
        await detachedCallBack();
        break;
      case AppLifecycleState.resumed:
        print("resume");
        await resumeCallBack();
        break;
    }
  }
}

class _VideoContainerState extends State<VideoContainer>
    with SingleTickerProviderStateMixin {
  // AnimationController _controller;

  List<VideoItem> playList = [];
  HLSVideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(vsync: this);
    // new HttpClient().getUrl(Uri.parse(widget.playlistUrl))
    // .then((HttpClientRequest request) => request.close())
    // .then((HttpClientResponse response) => response.transform(new Utf8Decoder()).listen((playlistContent) {
    //   M3uParser.parse(playlistContent)
    //   .then((List<M3uGenericEntry> list) {
    //     initVideoPlayerController(list);
    //   });
    // }));

    getLink();

    WidgetsBinding.instance
        .addObserver(new LifecycleEventHandler(resumeCallBack: () {
      // videoPlayerController.isActive = true;
      return this.hideNotification();
    }, suspendingCallBack: () {
      // videoPlayerController.isActive = false;
      return this.showNotification(
          "Cogent Video Player", "Developed for internship!");
    }, detachedCallBack: () {
      return this.hideNotification();
    }));

    MediaNotification.setListener('pause', () {
      setState(() => videoPlayerController.videoController.pause());
    });

    MediaNotification.setListener('play', () {
      setState(() => videoPlayerController.videoController.play());
    });

    MediaNotification.setListener('next', () {});

    MediaNotification.setListener('prev', () {});

    MediaNotification.setListener('select', () {});
  }

  Future getLink() async {
    Response response = await get(Uri.encodeFull(
        //"http://34.93.159.27/dashboard/PerfectBlessings/PerfectBlessings.m3u8"
        widget.playlistUrl
        ));
    print("g ${response.body} dd");

    var re = RegExp(r'(?<=RESOLUTION=)(.*)(?=)');
    var resolutions = re.allMatches(response.body);

    List res = [];

    resolutions.forEach((f) {
      res.add(f.group(0));
    });

    print(res);

    re = RegExp(r'(?<=)(.*)(?=.m3u8)');
    var links = re.allMatches(response.body);

    List linkRes = [];

    links.forEach((f) {
      if (f.group(0) != "") {
        linkRes.add(f.group(0));
      }
    });

    print(linkRes);

    initVideoPlayerController(res, linkRes);

    // if (match != null) print(match.group(1));
  }

  Future<void> hideNotification() async {
    try {
      await MediaNotification.hideNotification();
      // setState(() => status = 'hidden');
    } on PlatformException {}
  }

  Future<void> showNotification(title, author) async {
    try {
      await MediaNotification.showNotification(
          title: title,
          author: author,
          isPlaying: videoPlayerController.videoController.value.isPlaying);
      // setState(() => status = 'play');
    } on PlatformException {}
  }

  initVideoPlayerController(List res, List linkRes) async {
    Uri uri = Uri.parse(widget.playlistUrl);
    String path = uri.origin + uri.path;
    String directory = path.substring(0, path.lastIndexOf("/") + 1);

    print(directory);

    List<VideoItem> pList = [];

    for (int i = 0; i < res.length; i++) {
      pList.add(new VideoItem(
          resoultion: res[i], videoUri: directory + linkRes[i] + ".m3u8"));
    }

    print(pList.length);

    int index = 0;
    var connectivityResult = await (Connectivity().checkConnectivity());
    print(connectivityResult);
    print(pList);
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.none:
        index = 0;
        break;
      case ConnectivityResult.mobile:
        index = pList.length - 1;
        break;
    }
    VideoPlayerController videoPlayerController;
    print(index);
    videoPlayerController =
        VideoPlayerController.network(pList[index].videoUri);
    videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
    videoPlayerController.play();

    setState(() {
      playList = pList;

      this.videoPlayerController = new HLSVideoPlayerController(
          curPlaylistIndex: index,
          playList: playList,
          videoController: videoPlayerController);
    });
  }

  @override
  void dispose() {
    this.hideNotification();
    super.dispose();
    // _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    Wakelock.enable();
    return Container(
      child: playList.length == 0
          ? CircularProgressIndicator()
          : Expanded(
              child: HLSVideoPlayer(
              playList: playList,
              controller: videoPlayerController,
              isFullScreenScreen: true,
            )),
    );
  }
}
