import 'package:flutter/material.dart';

import 'package:cognent/bottomBar/home.dart';
import 'package:cognent/bottomBar/trending.dart';
import 'package:cognent/bottomBar/following.dart';


import 'package:cognent/utility/utils.dart';


import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

 int _selectedIndex = 0;
 bool isDark;


   List<Widget> _children() => [
	   Home(),
	   Trending(),
	   FollowingMain(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      //print(currentUser.displayName);
    });
  }

  void check() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs?.setBool("isDark", false);
      var isDarkmain = prefs.getBool('isDark') ?? true;
      setState((){
          isDark = isDarkmain;   
      });
   }
  
  @override
  void initState() {
   // check();
    print(isDark);
   
}

  @override
  Widget build(BuildContext context) {
     List<Widget> children = _children();

    return Scaffold(

    	 
    
      body: Center(
        child: children[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(

            icon:Icon(Icons.home,
                size:20,),
            title: new Text('Home'),
          ),
           BottomNavigationBarItem(
            icon:Icon(Icons.trending_up,
                size:20),
            title:new Text('Trending'),
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.favorite,
                size:20),
            title:new Text('Following'),
          ),
           
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:  Colors.blue,
        unselectedItemColor: Colors.black ,
        backgroundColor:   Colors.white ,
        

        onTap: _onItemTapped,
      ),
  

    );//Scaffold


  }
 
}

