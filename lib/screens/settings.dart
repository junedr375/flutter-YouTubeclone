import 'package:flutter/material.dart';


import 'package:cognent/screens/mychannel.dart';
import 'package:cognent/analytics/revenue.dart';

import 'package:cognent/coins/coins.dart';

import 'package:cognent/utility/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Settings extends StatefulWidget {
	@override
	_SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {


  var isDark = true;
  void changetoDark() async {
      
       if(isDark){
         
         setState((){

          isDark= false;
          });
       } else {
        setState((){

          isDark= true;
          });
         
      }

      
  }


  @override
  void initState(){

  }
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: (!isDark) ? Colors.black : Colors.white,
      ),
      home:Scaffold(
			appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: (!isDark) ? Colors.black : Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Container(
              
              
                    child: InkWell(
                     // splashColor: Colors.red, // inkwell color
                      child: SizedBox(width: 40, height: 40, child: Icon(Icons.arrow_back, color: (!isDark) ? Colors.white : Colors.black)),
                      onTap: () {
                        Navigator.of(context).pop();
                        },
                    ),
                  
                
              ),
              Container(
              child:Text('Settings', style:TextStyle(color:(!isDark) ? Colors.white : Colors.black)),
              ),
              Container(
                child: Text('')
              ),
            
            ]
          ),
        
        ),//AppBar 
			  body: ListView( 
          children: <Widget>[

          InkWell(
            onTap:(){
            // Navigator.push(context, MaterialPageRoute(builder:(context)=>new HomePage()));
            },
            child: ListTile(
              title: Text('General', style : TextStyle(color: (!isDark) ? Colors.white : Colors.black)),
              leading: Icon(Icons.menu ,color: (!isDark) ? Colors.white : Colors.black),

            ),//ListTile
          ),//InkWell
          InkWell(
            onTap:(){},
            child: ListTile(
              title: Text('Privacy ans Security', style : TextStyle(color: (!isDark) ? Colors.white : Colors.black)),
              leading: Icon(Icons.security ,color: (!isDark) ? Colors.white : Colors.black),
            ),//ListTile
          ),//InkWell
          InkWell(
            onTap:(){},
            child: ListTile(
              title: Text('Account', style : TextStyle(color: (!isDark) ? Colors.white : Colors.black)),
              leading: Icon(Icons.person ,color: (!isDark) ? Colors.white : Colors.black),

            ),//ListTile
          ),//InkWell
          InkWell(
            onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => MYChannel()),);
                      
              },
            child: ListTile(
              title: Text('My Channels', style : TextStyle(color: (!isDark) ? Colors.white : Colors.black)),
              leading: Icon(Icons.view_compact ,color: (!isDark) ? Colors.white : Colors.black),

            ),//ListTile
          ),//InkWell
          InkWell(
            onTap:(){
                Navigator.push(context,MaterialPageRoute(builder: (context) => Coins()),);
                      
              },
            child: ListTile(
              title: Text('My Coins', style : TextStyle(color: (!isDark) ? Colors.white : Colors.black)),
              leading: Icon(Icons.monetization_on ,color: (!isDark) ? Colors.white : Colors.black),

            ),//ListTile
          ),//InkWell
          InkWell(
            onTap:(){
              //getTheme();
              changetoDark();
              
              },
            child: ListTile(
              title:(!isDark) ? Text('Change to Light Theme', style : TextStyle(color: Colors.white)) :Text('Change to Dark Theme', style : TextStyle(color: Colors.black)),
              leading: Icon(Icons.brightness_3 ,color: (!isDark) ? Colors.white : Colors.black),
              //Icons

            ),//ListTile
          ),//InkWell
          InkWell(
            onTap:(){},
            child: ListTile(
              title: Text('Billing & Payments', style : TextStyle(color: (!isDark) ? Colors.white : Colors.black)),
              leading: Icon(Icons.favorite ,color: (!isDark) ? Colors.white : Colors.black),

            ),//ListTile
          ),//InkWell
          Divider(),
          InkWell(
            onTap:(){},
            child: ListTile(
              title: Text('About', style : TextStyle(color: (!isDark) ? Colors.white : Colors.black)),
              leading: Icon(Icons.help ,color: (!isDark) ? Colors.white : Colors.black),

            ),//ListTile   
          ),//InkWell
          InkWell(
            onTap:(){},
            child: ListTile(
              title: Text('Log Out', style : TextStyle(color: (!isDark) ? Colors.white : Colors.black)),
              leading: Icon(Icons.close ,color: (!isDark) ? Colors.white : Colors.black),

            ),//ListTile
          ),//InkWell
          ],//Widget
        ),//ListView
      )
		);
	}
}





/////////////// Colors for the app////////////////////////////////

//Color selectedItemColor = (!isDark) ? Colors.blue : Colors.white;