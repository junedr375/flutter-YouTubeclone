import 'package:flutter/material.dart';

import 'package:cognent/analytics/revenue.dart';

class UserOverTime extends StatefulWidget {
	@override
	_UserOverTimeState createState() => _UserOverTimeState();
}

class _UserOverTimeState extends State<UserOverTime> {
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
	        		child:Text('Analytics', style:TextStyle(color: Colors.black)),
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
            		 			//		Navigator.push(context,MaterialPageRoute(builder: (context) => ChannelName()),);
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
            	padding: EdgeInsets.only(top:10),
            	height: 60,
            	child: Row(
            	//	mainAxisAlignment: MainAxisAlignment.spaceBetween,
	        			children: <Widget>[
	        				
	            	
	            		Container(
	            			padding: EdgeInsets.only(left:65,right:65),
	            			
	            			//padding: EdgeInsets.only(left:30),
	            			child: GestureDetector(
	            				onTap: () {
	            						Navigator.push(context,MaterialPageRoute(builder: (context) => Revenue()),);
            		 			
	            				},
	            				child: Center(
	            					child:Column(
		            					children: <Widget>[
		            						Text('\$ 1.5k',
		            							style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
		            						),
		            						Text('Revenue'),
		            					]
		            				)
	            				)
	            			)
	            		),
	            		Container(
	            			width: 170,
	            			padding: EdgeInsets.only(left:35),
	            			color: Colors.blue[100],
	            			child: GestureDetector(
	            				onTap: () {
	            					//Navigator.push(context,MaterialPageRoute(builder: (context) => Following()),);
	            				},
	            				child: Center(
	            					child:Column(
		            					children: <Widget>[
		            						Text('5k',
		            							style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
		            						),
		            						Text('Users over Time'),
		            					]
		            				)
	            				)
	            			)
	            		),
	          
	            		
            		]
            	)
            ),
	      		Container(
	      			child: Center(

	              child: new Image.asset(
	                'images/userovertime.png',
	                height:400,
	                width: 750,
	                fit: BoxFit.fitWidth,
	                scale: 0.4,
	                
	                ),
	            ),
	      		),
					]
				)
			)
		);
	}
}