import 'package:flutter/material.dart';

import 'package:cognent/screens/settings.dart';
import 'package:cognent/screens/VideoPlayerPage.dart';




//module
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;


class Trending extends StatefulWidget {
	@override
	_TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {

	List data;
	List dataGen;
	bool isLoaded = false;
	bool isGenLoaded = false;

	void loadJson() async {
		String jsonString = await rootBundle.loadString('assets/text/videoJson.json');
		data = json.decode(jsonString);
		setState((){
			isLoaded = true;
			});
		print(data);
	}
	void loadGenJson() async {
		String jsonString = await rootBundle.loadString('assets/text/treanding.json');
		dataGen = json.decode(jsonString);
		setState((){
			isGenLoaded = true;
			});
		print(data);
		loadJson();
	}

  @override
  void initState(){
  	loadGenJson();
  	loadJson();

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
		        		child: ClipOval(
								  child: Material(
								    color: Colors.blue[100],
								    child: InkWell(
								     // splashColor: Colors.red, // inkwell color
								      child: SizedBox(width: 40, height: 40, child: Icon(Icons.person, color: Colors.blue)),
								      onTap: () {
								      	Navigator.push(
												    context,
												    MaterialPageRoute(builder: (context) => Settings()),
												  );
								      	},
								    ),
								  ),
								)
	        		),
	        		Container(
	        		child:Text('Trending', style:TextStyle(color: Colors.black)),
	        		),
		        	Container(
		        		child:GestureDetector(
		        			onTap: () {
		        				print('search');

		        			},
		        			child:Icon(Icons.search, color: Colors.black),
		        		)
	        		),
	        	]
	        ),
	      ),//AppBar 
			body:  (!isGenLoaded) ? Center(
		        child: CircularProgressIndicator(
		          backgroundColor: Colors.black,
		          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
		          ),
		      ) : ListView(

        children: <Widget>[
          Container(
          height: 50,
          child: ListView.builder(

              padding: EdgeInsets.symmetric(horizontal: 5.0),
              scrollDirection: Axis.horizontal,
              itemCount: dataGen == null ? 0 : dataGen.length,
              itemBuilder: (BuildContext context, int indexChild) {
                return  Container(
			            padding: EdgeInsets.only(
			                top: 10, left: 10),
			            child: Container(
			                width: 130,
			                height: 40,
			                decoration: BoxDecoration(
			                  borderRadius: BorderRadius.circular(15),
			                  color: Colors.blue,//lsloginSignupWithApiButton
			                ),
			                child: Container(
		                    padding: EdgeInsets.only(
		                        top: 5, bottom: 5),

		                    child: OutlineButton(
		                      borderSide: BorderSide.none,
		                      child: Center(
		                        child: Text(
		                        	//'Music'
		                        	dataGen[indexChild]['Gen']
		                        ),
		                      ),
		                      onPressed: () {
		                      
		                      },
		                    ),
			               ),
		              ),
		            );//Connatiner
			        },
            ),
        ),

        Container(
          height: MediaQuery.of(context).size.height*0.75,
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
		                    height: 140,
		                    margin: EdgeInsets.symmetric(
		                      horizontal: 4.0,
		                      vertical: 10.0,
		                    ),
		                    width: 350,
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
		                        height:120,
		                        width:350,
		                        image: NetworkImage(data[indexChild]['thumbnail']),
		                        fit: BoxFit.fitWidth,
		                      ),
		                    ),

		      
		                  ),//Container
		       
		                ],//Widget
		              ),//Stack
		            ),//GestureDetector

		            Container(
		            	padding: EdgeInsets.only(left:10,right:10,top:5),
		            	child: Text('${data[indexChild]['name']} | ${data[indexChild]['description']}', style:TextStyle(fontSize:16))
		            ),
		            Container(
		            	padding: EdgeInsets.only(right:80,top:10),
		            	child: Text('${data[indexChild]['channelName']}           ${data[indexChild]['view']} views' , style:TextStyle(color: Colors.grey[500],fontSize:15))
		            ),
          		],
          	),
          );
			        },
            ),
        )
                  
       		 ],
        ),

		);
	}
}







