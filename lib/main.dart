import 'package:flutter/material.dart';
import 'package:cognent/home/homePage.dart';

import 'package:cognent/utility/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: appBackgroundColor,
      ),
      home: HomePage()
    );
  }
}
