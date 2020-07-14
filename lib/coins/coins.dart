import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;


class Coins extends StatefulWidget {
	@override
	_CoinsState createState() => _CoinsState();
}

class _CoinsState extends State<Coins> {

	List data;
	bool isLoaded = false;

	void loadJson() async {
		String jsonString = await rootBundle.loadString('assets/text/coins.json');
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
	        		child:Text('Coins', style:TextStyle(color: Colors.black)),
	        		),
		        	Container(
		        		child:GestureDetector(
		        			onTap: () {
		        				print('search');
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
			            		 				padding: EdgeInsets.only(right:200),
				            		 			child:Text('Robin Hood',
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
            	padding: EdgeInsets.only(top:15,bottom:25),
            	child: Row(
            		children: <Widget>[
            			Container(
            				padding: EdgeInsets.only(left:20),
            				child: Text(
            					'Balance',
            					style: TextStyle(fontSize:20),

            				)

            			),
            			Container(
            				padding: EdgeInsets.only(left:110),
            				child: Text(
            					'1,500',
            					style: TextStyle(fontWeight: FontWeight.bold,fontSize:30),

            				)
            			),
            			Container(
            				padding: EdgeInsets.only(left:8),
            				child: Text(
            					'coins',
            					style: TextStyle(fontSize:20),

            				)

            			)
            		]

            	)

            ),

						Container(
							child: Row(
								mainAxisAlignment: MainAxisAlignment.spaceBetween,
	        			children: <Widget>[
									Container(
		            		padding: EdgeInsets.only(left:20),
				            child: Container(
				                width: 150,
				                height: 50,
				             
				                child: Container(
			                   	color: Colors.blue[300],

			                    child: OutlineButton(
			                    	
			                    //  borderSide: BorderSide(color:Colors.black),
			                      child: Center(
			                        child: Text('ADD COINS',
			                        	style: TextStyle(color: Colors.white)
			                        ),
			                      ),
			                      //shape: StadiumBorder(),
			                      onPressed: () {
			                      
			                      },
			                    ),
				               ),
			              ),
			            ),//Connatiner
			        		Container(
		            		padding: EdgeInsets.only(right:20),
				            child: Container(
				                width: 150,
				                height: 50,
				             
				                child: Container(
			                   	color: Colors.blue[300],

			                    child: OutlineButton(
			                    	
			                     // borderSide: BorderSide(color:Colors.black),
			                      child: Center(
			                        child: Text('WITHDRAW MONEY',
			                        	style: TextStyle(color: Colors.white)
			                        ),
			                      ),
			                      //shape: StadiumBorder(),
			                      onPressed: () {
			                      
			                      },
			                    ),
				               ),
			              ),
			            ),//Connatiner

								]

							),

						),

						Container(
      				padding: EdgeInsets.only(top:20,right:200),
      				child: Text(
      					'Send Coins to',
      					style: TextStyle(fontSize:20),

      				)

      			),

      			Container(
      				padding: EdgeInsets.only(top:20),
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
	            		 	padding: EdgeInsets.only(left:20),
			        	
				        		child: ClipOval(
										  child: Material(
										    color: Colors.blue[100],
										    child: InkWell(
										     // splashColor: Colors.red, // inkwell color
										      child: SizedBox(width: 50, height: 50, child: Icon(Icons.add, color: Colors.blue)),
										      onTap: () {
										     
										      	},
											    ),
											  ),
											)
				        		),

      					]

      				)

      			),

      		 Container(
      				padding: EdgeInsets.only(top:20,right:260),
      				child: Text(
      					'History',
      					style: TextStyle(fontSize:20),

      				)

      			),

      		 
      		  Container(
      		  	height: MediaQuery.of(context).size.height*0.30,
      		 	child: (!isLoaded) ? Center(
				        child: CircularProgressIndicator(
				          backgroundColor: Colors.black,
				          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
				          ),
				      ) : ListView.builder(
						   // padding: EdgeInsets.symmetric(horizontal: 5.0),
				        scrollDirection: Axis.vertical,
				        itemCount: data == null ? 0 : data.length,
				        itemBuilder: (BuildContext context, int indexChild) {
				          return


      		 	
      		 			Container(
										padding :EdgeInsets.only(top:0),
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
												      child: SizedBox(width: 40, height: 40, child: Icon(Icons.person, color: Colors.blue)),
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
						            		 				padding: EdgeInsets.only(right:50),
							            		 			child:Text(data[indexChild]['Name'],
							            		    	 style: TextStyle(fontWeight: FontWeight.bold),
							            		 			),
							            		 		),
							            		 		Container(
						            		 				padding: EdgeInsets.only(right:30),
							            		 			child:Text('${data[indexChild]['Followes']} Followers',
							            		    	// style: TextStyle(fontWeight: FontWeight.bold),
							            		 			),
							            		 		),
						            		  	

					            		 			]
					            		 		),
				            		 		)

				            		 			
				            		 		
			            		 		),
			            		 	),
			            		 	Container(
			            				padding: EdgeInsets.only(left:30),
			            				child: Text(
			            					data[indexChild]['coins'],
			            					style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),

			            				)
			            			),
				            			Container(
				            				padding: EdgeInsets.only(right:20),
				            				child: Text(
				            					'coins',
				            					style: TextStyle(fontSize:20),

				            				)

				            			)



			            		
			            		]
			            	)
			            );

	 		
			      		 }
      				 ),


      		 	),



					]
				)
			)


		);
	}
}