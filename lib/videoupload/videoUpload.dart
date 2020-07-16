import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';



class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  File videoFile;
  bool previewed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
 
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Container(
              
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  iconSize: 30,
                  color: Colors.black,
                  splashColor: Colors.blue,
                  onPressed: () {
                     Navigator.of(context).pop();
                    },
                ),
              ),
              Container(
              child:Text('Video Preview', style:TextStyle(color: Colors.black)),
              ),
              Padding(
                padding: EdgeInsets.only(left:10),
              )
             
            ]
          ),
        ),//AppBar
     
      body: ListView(
        children: <Widget>[
          Visibility(
        visible: _controller != null,
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
           
              return AspectRatio(
                aspectRatio:  _controller.value.aspectRatio,
             
                child: VideoPlayer(_controller),
              );
            } else {
              // If the VideoPlayerController is still initializing, show a
              // loading spinner.
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      Container(
        padding: EdgeInsets.only(top:20),
        child: (!previewed) ? Center(
          child: RaisedButton(
            
            child: Center(
              child:Text("Video Preview"),
            ),
            onPressed: () {

              getVideo();
              setState((){
                previewed = true;
              });
            },
          ),
        ) : Center(
          child: RaisedButton(
            
            child: Center(
              child:Text("Upload Video to Server"),
            ),
            onPressed: () {
              String msg = 'Actual Server Needed to upload the Video';
              _showMyDialog(msg);
             // getVideo();
            },
          ),
        )
      ),
    ],
  ),
  floatingActionButton: _controller == null
      ? null
      : FloatingActionButton(
          onPressed: () {
          
            setState(() {
             
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
               
                _controller.play();
              }
            });
          },
        
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
    );
  }

  Future getVideo() async {
    Future<File> _videoFile =
    ImagePicker.pickVideo(source: ImageSource.gallery);
      _videoFile.then((file) async {
      setState(() {
        videoFile = file;
        _controller = VideoPlayerController.file(videoFile);
        _initializeVideoPlayerFuture = _controller.initialize();
        _controller.setLooping(false);
       });
    });
  }

  Future<void> _showMyDialog(String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(

          title: Text('Alert!'),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(msg),
              
              ],
            ),
          ),
          actions: <Widget>[
             
            FlatButton(
              child: Center(
                child:Text('Back',
                  style: TextStyle(color: Colors.red,fontSize:20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        
        );

      },
    );
  }
}