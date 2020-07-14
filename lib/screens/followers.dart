import 'package:flutter/material.dart';


import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class Followers extends StatefulWidget {
	final String channelName;
	Followers(this.channelName);

	@override
	_FollowersState createState() => _FollowersState(channelName);
}

class _FollowersState extends State<Followers> {
	final String channelName;
	_FollowersState (this.channelName);

	/*bool isTap =  false;
	var arr = ['1','1','1','1','1','1','1','1','1','1','1','1'];
*/
	List data;
	bool isLoaded = false;

	void loadJson() async {
		String jsonString = await rootBundle.loadString('assets/text/followers.json');
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
	        		child:Text('Followers', style:TextStyle(color: Colors.black)),
	        		),
		        	Container(
		        		child:GestureDetector(
		        			onTap: () {
		        				print('srot');
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
									     
									      	},
										    ),
										  ),
										)
			        		),
            		 Container(

            		 	padding: EdgeInsets.only(left:15),
            		 		child: GestureDetector(
            		 			onTap: () {
            		 					//Navigator.push(context,MaterialPageRoute(builder: (context) => ChannelName()),);
            		 				},
	            		 	child:
	            		 		Container(
		            		 		child: Column(
		            		 			children: <Widget>[
		            		 				Padding(
		            		 					padding: EdgeInsets.only(top:15)
		            		 				),
			            		 			Container(
			            		 				padding: EdgeInsets.only(right:150),
				            		 			child:Text(channelName,
				            		    	 style: TextStyle(fontWeight: FontWeight.bold),
				            		 			),
				            		 		),
				            		 		Container(
			            		 				padding: EdgeInsets.only(right:90),
				            		 			child:Text('12k Followers | 34k Following',
				            		    	// style: TextStyle(fontWeight: FontWeight.bold),
				            		 			),
				            		 		),
			            		 			

		            		 			]
		            		 		),
	            		 		)

	            		 			
	            		 		
            		 		),
            		 	),

            		
            		]
            	)
            ),


            Container(
            	padding: EdgeInsets.only(top:10, right:230),
            	child:Text('Followers',
      		    	 style: TextStyle(fontWeight: FontWeight.bold),
      		 			),
            ),
            Container(
            	height:MediaQuery.of(context).size.height*0.70,
            	child: (!isLoaded) ? Center(
				        child: CircularProgressIndicator(
				          backgroundColor: Colors.black,
				          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
				          ),
				      ) :  ListView.builder(
						    padding: EdgeInsets.symmetric(horizontal: 5.0),
				        scrollDirection: Axis.vertical,
				        itemCount: data == null ? 0 : data.length,
				        itemBuilder: (BuildContext context, int indexChild) {
				          return Container(
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

            		 	padding: EdgeInsets.only(left:15),
            		 		child: GestureDetector(
            		 			onTap: () {
            		 					//Navigator.push(context,MaterialPageRoute(builder: (context) => ChannelName()),);
            		 				},
	            		 	child:
	            		 		Container(
		            		 		child: Column(
		            		 			children: <Widget>[
		            		 				Padding(
		            		 					padding: EdgeInsets.only(top:15)
		            		 				),
			            		 			Container(
			            		 				padding: EdgeInsets.only(right:24),
				            		 			child:Text(data[indexChild]['name'],
				            		    	 style: TextStyle(fontWeight: FontWeight.bold),
				            		 			),
				            		 		),
				            		 		Container(
			            		 				padding: EdgeInsets.only(right:10),
				            		 			child:Text('${data[indexChild]['Followers']} Followers',
				            		    	// style: TextStyle(fontWeight: FontWeight.bold),
				            		 			),
				            		 		),
			            		 			

		            		 			]
		            		 		),
	            		 		)

	            		
	            		 			
	            		 		
            		 		),
            		 	),

            		   Container(
		            		padding: EdgeInsets.only(top: 10),
				            child: Container(
				                width: 100,
				                height: 50,
				            
				                child: Container(
			                 
			                    color:(data[indexChild]['isFollowing'] == 'yes') ? Colors.white : Colors.blue,
			                     
			                    child: OutlineButton(
			                     borderSide: BorderSide(color:Colors.black),
			                      child: Center(
			                        child: (data[indexChild]['isFollowing'] == 'yes') ? Text('Follow') : Text('Unfollow') ,
			                      ),
			                  
			                      onPressed: () {
			                      	if (data[indexChild]['isFollowing'] == 'yes'){
			                      		setState((){
			                      			data[indexChild]['isFollowing'] ='no';
			                     			});
			                    	  } else  {
			                      		setState((){
			                      			data[indexChild]['isFollowing'] = 'yes';
			                     		 	});
			                      	}

			                      	
			                      },
			                    ),
				               ),
			              ),
			            ),//Connatiner
            		]
            	)
            );
				        },
				      ),
            ),
					]
				)
			)

		);
	}
}