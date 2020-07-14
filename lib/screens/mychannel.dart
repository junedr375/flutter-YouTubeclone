import 'package:flutter/material.dart';

import 'package:cognent/screens/VideoPlayerPage.dart';
import 'package:cognent/screens/followers.dart';
import 'package:cognent/screens/following.dart';
import 'package:cognent/analytics/revenue.dart';

//module
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class MYChannel extends StatefulWidget {
	@override
	_MYChannelState createState() => _MYChannelState();
}

class _MYChannelState extends State<MYChannel> {
	
	List data;
	bool isLoaded = false;

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
		return Scaffold(
			appBar:  AppBar(
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
	        		child:Text('Actual Server Needed', style:TextStyle(color: Colors.black)),
	        		),
		        	Container(
		        		child:GestureDetector(
		        			onTap: () {
		        				print('search');
		        				Navigator.push(context,MaterialPageRoute(builder: (context) => Revenue()),);
		        			},
		        			child:Icon(Icons.sort, color: Colors.black),
		        		)
	        		),
	        	]
	        ),
	      ),//AppBar

			body: Container(
				child: Column(
					children: <Widget>[
						Container(
							padding :EdgeInsets.only(top:10),
            	height: 80,
            	child: Row(
            		mainAxisAlignment: MainAxisAlignment.spaceBetween,
	        			children: <Widget>[
            		 Container(
            		 	padding: EdgeInsets.only(left:20),
		        	
			        		child: ClipOval(
									  child: Material(
									    color: Colors.blue[100],
									    child: InkWell(
									     // splashColor: Colors.red, // inkwell color
									      child: SizedBox(width: 50, height: 50, child: Icon(Icons.person, color: Colors.blue)),
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

            		 	padding: EdgeInsets.only(right:30),
            		 		child: GestureDetector(
            		 			onTap: () {
            		 				//	Navigator.push(context,MaterialPageRoute(builder: (context) => ChannelName()),);
            		 				},
	            		 	child:
	            		 		Container(
		            		 		child: Text('Server needed',
		            		 			 style: TextStyle(fontWeight: FontWeight.bold),
		            		 			)
		            		 		),
	            		 		/*Container(
	            		 			//padding: EdgeInsets.only(left:10),
	            		 			child: Text('114.5k followers',)
	            		 			),*/

	            		 			
	            		 		
            		 		),
            		 	),

            		   Container(
		            		padding: EdgeInsets.only(top: 10,right:10),
				            child: Container(
				                width: 130,
				                height: 50,
				              /*  decoration: BoxDecoration(
				                  borderRadius: BorderRadius.circular(15),
				                  color: Colors.white//lsloginSignupWithApiButton
				                ),*/
				                child: Container(
			                    padding: EdgeInsets.only(
			                        top: 5, bottom: 5),

			                    child: OutlineButton(
			                    	color: Colors.blue,
			                      borderSide: BorderSide(color:Colors.black),
			                      child: Center(
			                        child: Text('Upload'),
			                      ),
			                      //shape: StadiumBorder(),
			                      onPressed: () {
			                      
			                      },
			                    ),
				               ),
			              ),
			            ),//Connatiner
            		]
            	)
            ),


            Container(
            	padding: EdgeInsets.only(top:10),
            	height: 60,
            	child: Row(
            		mainAxisAlignment: MainAxisAlignment.spaceBetween,
	        			children: <Widget>[
	        				Padding(
	            			padding: EdgeInsets.symmetric(horizontal:5),
	            		),
	            		Container(
	            			//padding: EdgeInsets.only(left:30),
	            			child: GestureDetector(
	            				onTap: (){

	            				},
	            				child: Column(
	            					children: <Widget>[
	            						Text('140',
	            							style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
	            						),
	            						Text('video'),
	            					]
	            				)
	            			)
	            		),
	            		Container(
	            			//padding: EdgeInsets.only(left:30),
	            			child: GestureDetector(
	            				onTap: () {
	            					Navigator.push(context,MaterialPageRoute(builder: (context) => Followers('Real Server Nedeed')),);
	            				},
	            				child: Column(
	            					children: <Widget>[
	            						Text('24k',
	            							style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
	            						),
	            						Text('Followers'),
	            					]
	            				)
	            			)
	            		),
	            		Container(
	            	//		padding: EdgeInsets.only(left:30),
	            			child: GestureDetector(
	            				onTap: () {
	            				Navigator.push(context,MaterialPageRoute(builder: (context) => Following('Real Server Nedeed')),);
	            				},
	            				child: Column(
	            					children: <Widget>[
	            						Text('98k',
	            							style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
	            						),
	            						Text('Following'),
	            					]
	            				)
	            			)
	            		),
	            		Padding(
	            			padding: EdgeInsets.symmetric(horizontal:5),
	            		),
            		]
            	)
            ),

            Container(
            	//height: 500,
            	child:  _tabSection(context)
            ),


					]
				)
			)
		);
	}

	Widget _tabSection(BuildContext context) {
  return DefaultTabController(
    length: 2,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          child: TabBar(
	        	indicatorColor: Colors.blue,
	          labelColor: Colors.black,
	          unselectedLabelColor: Colors.grey,  	
          	tabs: [
				      Tab(text: "Latest Videos"),
	            Tab(text: "All Videos"),
            //Tab(text: "User"),
          ]),
        ),
        Container( 
          //Add this to give height
          height: MediaQuery.of(context).size.height*0.58,
          child: TabBarView(children: [
            Container(
              child: (!isLoaded) ? Center(
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
								                      vertical: 10.0,
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
								                        fit: BoxFit.fitWidth,
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
            Container(
              child: (!isLoaded) ? Center(
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
								                      vertical: 10.0,
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
								                        fit: BoxFit.fitWidth,
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
          
          ]),
        ),
      ],
    ),
  );
}
}