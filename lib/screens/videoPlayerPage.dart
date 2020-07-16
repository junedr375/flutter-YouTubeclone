import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'package:cognent/screens/channelName.dart';

import 'package:cognent/testVideoPlayer/videoplayer.dart';


//package

import 'package:share/share.dart';


//module
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;


class VideoPlayerPage extends StatefulWidget {
	final String videoUrl;
	final String thumbnail;
	final String videoName;
	final String description;
	final String views;
	final String channelName;
	final String followers;
	VideoPlayerPage(this.videoUrl,this.thumbnail,this.videoName,this.description,this.views,this.channelName,this.followers);

	@override
	_VideoPlayerPageState createState() => _VideoPlayerPageState(videoUrl,thumbnail,videoName,description,views,channelName,followers);
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
	final String videoUrl;
	final String thumbnail;
	final String videoName;
	final String description;
	final String views;
	final String channelName;
	final String followers;
	_VideoPlayerPageState(this.videoUrl,this.thumbnail,this.videoName,this.description,this.views,this.channelName,this.followers);

  //String sampleUrl = "https://d9nq9lwzqhczf.cloudfront.net/1df51bf8-c868-47ef-b53a-5ba0010fa6ed/hls/video-3.m3u8?Expires=1613556544&Signature=S53CqJfhLVYWb6wpmJ3YRmPxtLwgA1TtDUq2XHzRcdHehLHun7N5i0eevcG~NWVCVkZ5R4OXag6v11omuTTP~yfSqYpeWplaFdwSx55XdgcnAsoSkBeRziokt~yBM8cmNUHjL2gmWAN4tEsK2qctpmhHx3Na29JchP~4Iz3z~UyM10wmhgTidpqGo6~V-cZovujhBSpbnjSJ-Ubl0kib2PYy47iS2B5ntEebak~oxNSWmlD6XG8XUuUnSL9ISL-GURSll~xRv7Ro1lprBrBYn5nOs-pv6wKWwI5maBNEeA9pcDzrBBsJzhElkCEybnIfMfm0FpKlUtzdPfWBaETTMQ__&Key-Pair-Id=APKAIIGAWAHJPV7RP5MA";
	
	List data;
	bool isLoaded = false;
	bool isTap = false;

	bool isLiked = false;
	bool isdisLiked = false;

	void loadJson() async {
		String jsonString = await rootBundle.loadString('assets/text/videoJson.json');
		data = json.decode(jsonString);
		setState((){

			isLoaded = true;
			});
		print(data);
	}

  @override
  void initState(){
	loadJson();
  }

  @override
  Widget build(BuildContext context) {
	return
	  Scaffold(
	 
		body: SafeArea(
			child: Center(
				child:Column(
			children: <Widget>[
			  Container(
				height:240,
				//padding: EdgeInsets.only(top:1),
				child: SafeArea(
					  child: Center(
						child: Column(
						  mainAxisAlignment: MainAxisAlignment.center,
						  children: <Widget>[
								VideoContainer(
								  videoUrl
								)//Text('dv')
						  ],
						),
					  ),
					)
			),
			Container(
				height:20,
				padding: EdgeInsets.only(top:5, left:10,right:135),
				child: Text(
					'2 months ago          ${views} views',
					 style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.bold),
				)
			),
			Container(
				height:50,
				padding: EdgeInsets.only(top:5, left:10,right:10),
				child: Text(
					'${videoName} | ${description}',
					 style: TextStyle(fontWeight: FontWeight.bold),
				)
			),
			Container(
				height: 70,
				padding: EdgeInsets.only(left:10,right:10),
				child: Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
						
						Container(
							child: Column(
								children: <Widget>[
									Container(
										child:IconButton(
											icon: Icon(
											  Icons.thumb_up,
											),
											iconSize: 25,
											color: (!isLiked) ? Colors.black : Colors.blue,
											splashColor: Colors.grey,
											onPressed: () {
												if(!isLiked){
													setState((){
														isLiked = true;
														isdisLiked = false;
														});
												} else {
													setState((){
														isLiked = false;
														//isdisLiked = true;
													});
												}
											},
										 ),
									),
									Container(
										//padding: EdgeInsets.only(top:4),
										child: Center(child:Text('Like'))
									),
						
								]
							),
						),
						Container(
							child: Column(
								children: <Widget>[
									Container(
										child:IconButton(
											icon: Icon(
											  Icons.thumb_down,
											),
											iconSize: 25,
											color: (!isdisLiked) ? Colors.black : Colors.blue,
											splashColor: Colors.blue,
											onPressed: () {
												if(!isdisLiked){
													setState((){
														isLiked = false;
														isdisLiked = true;
														});
												} else {
													setState((){
														//isLiked = false;
														isdisLiked = false;
													});
												}
												},
										  ),
									),
									Container(
										//padding: EdgeInsets.only(),
										child: Center(child:Text('Dislike'))
									),
						
								]
							),
						),
						Container(
							child: Column(
								children: <Widget>[
									Container(
										child:IconButton(
											icon: Icon(
											  Icons.shop,
											),
											iconSize: 25,
											color: Colors.black,
											splashColor: Colors.grey,
											onPressed: () {},
										  ),
									),
									Container(
										//padding: EdgeInsets.only(top:4),
										child: Center(child:Text('Cart'))
									),
						
								]
							),
						),
						Container(
							child: Column(
								children: <Widget>[
									Container(
										child:IconButton(
											icon: Icon(
											  Icons.share,
											),
											iconSize: 25,
											color: Colors.black,
											splashColor: Colors.grey,
											onPressed: () {

												Share.share('check out my cogent video link ${videoUrl}');
												},
										  ),
									),
									Container(
										//padding: EdgeInsets.only(top:4),
										child: Center(child:Text('Share'))
									),
						
								]
							),
						),
						Container(
							child: Column(
								children: <Widget>[
									Container(
										child:IconButton(
											icon: Icon(
											  Icons.comment,
											),
											iconSize: 25,
											color: Colors.black,
											splashColor: Colors.grey,
											onPressed: () {},
										  ),
									),
									Container(
										//padding: EdgeInsets.only(top:4),
										child: Center(child:Text('Comment'))
									),
						
								]
							),
						),

  
					]
				),
					),
			Divider(),
			Container(
				height: 60,
				child: Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
	        children: <Widget>[
					 Container(
						padding: EdgeInsets.only(left:10),
					
							child: ClipOval(
									  child: Material(
										color: Colors.blue[100],
										child: InkWell(
										 // splashColor: Colors.red, // inkwell color
										  child: SizedBox(width: 40, height: 40, child: Icon(Icons.person, color: Colors.blue)),
										  onTap: () {
										  /*	Navigator.push(
														context,
														MaterialPageRoute(builder: (context) => Settings()),
													  );*/
											},
											),
										  ),
										)
							),
					 Container(

						padding: EdgeInsets.only(right:40, top:15),
							child: GestureDetector(
								onTap: () {
										Navigator.push(context,MaterialPageRoute(builder: (context) => ChannelName(
											
											channelName
											)),);
									},
								child:Column(
								children: <Widget>[
								Container(
									child: Text( channelName,
										 style: TextStyle(fontWeight: FontWeight.bold),
										)
									),
								Container(
									//padding: EdgeInsets.only(left:10),
									child: Text('${followers} followers',)
									),

									]
								),
							),
						),

					   Container(
							padding: EdgeInsets.only(top: 10, right: 10),
							child: Container(
								width: 120,
								height: 40,
							
								child: Container(
							
									color: (isTap) ? Colors.white : Colors.blue,
									child: OutlineButton(
									  borderSide: BorderSide(color:Colors.black),
									  child: Center(
										child: (isTap) ? Text('Follow') : Text('Unfollow'),
									  ),
								  //shape: StadiumBorder(),
										  onPressed: () {
										  	if(isTap) {
										  		setState((){
										  			isTap = false;
										  		});
										  	} else {
										  		setState((){
										  			isTap = true;
										  		});
										  	}
										  
										  },
										),
							   ),
						  ),
						),//Connatiner
					]
				)
			),
			Container(
					height:MediaQuery.of(context).size.height*0.25,
				
					child:(!isLoaded) ? Center(
						child: CircularProgressIndicator(
						  backgroundColor: Colors.black,
						  valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
						  ),
					  ) : ListView.builder(
							padding: EdgeInsets.symmetric(horizontal: 5.0),
						scrollDirection: Axis.vertical,
						itemCount: data == null ? 0 : data.length,
						itemBuilder: (BuildContext context, int indexChild) {
						  return Container(
							child: Column(
								children: <Widget>[

									Padding(
										padding: EdgeInsets.only(top:20),
									),
									Row(
										children:<Widget>[
											GestureDetector(
												onTap: () {
													print('videoScreen');
													Navigator.push(context,MaterialPageRoute(builder: (context) => VideoPlayerPage(
					          					data[indexChild]['videoUrl'],
					          					data[indexChild]['thumbnail'],
					          					data[indexChild]['name'],
					          					data[indexChild]['description'],
					          					data[indexChild]['view'],
					          					data[indexChild]['channelName'],
					          					data[indexChild]['channelFollower'],

				          					)),);
													},
												child: Stack(
												children: <Widget>[
												  Container(
													height: 130,
													margin: EdgeInsets.symmetric(
													  horizontal: 4.0,
													  vertical: 5.0,
													),
													width: 150,
													decoration: BoxDecoration(
													  borderRadius: BorderRadius.circular(0.0),
													  boxShadow: [
														BoxShadow(
														  color: Colors.black,//nhCategoryBoxShadowColor,
														  offset: Offset(0.0, 4.0),
														  blurRadius: 6.0,
														),
													  ],
													),
													child: ClipRRect(
													  borderRadius: BorderRadius.circular(5.0),
													 child: Image(
														height:130,
														width:150,
														image: NetworkImage(data[indexChild]['thumbnail']),
														fit: BoxFit.fill,
													  ),
													),

									  
												  ),//Container
									   
												],//Widget
											  ),//Stack
											),//GestureDetector
											Container(
												width: 192,
												child: Column(
													children: <Widget>[
														Container(
															padding: EdgeInsets.only(left:10),
															child: Text('${data[indexChild]['name']} , ${data[indexChild]['description']} ',
																style: TextStyle(fontWeight: FontWeight.bold),
															),
														),
														Padding(
															padding: EdgeInsets.only(top:20,),
															),
														Container(
															padding: EdgeInsets.only(right:40),
															child: Text('${data[indexChild]['channelName']}\n ${data[indexChild]['view']} views',
																style: TextStyle(color: Colors.grey[500]),
															),
														),
													
													]
												)

											),
								   
										  ]
										),
								
									],
								),
						  );
						},
					  ),
					),
				  ]
				),
			),
		),
	
	 
	);
  }


}
