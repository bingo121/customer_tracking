import 'package:customer_tracking/app.dart';
import 'package:customer_tracking/login.dart';
import 'package:flutter/material.dart';
import 'package:customer_tracking/customer_page.dart';
import 'package:customer_tracking/visitRecord_Detail.dart';
import 'package:customer_tracking/customer_change.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '用户跟踪访问',
      theme: mDefaultTheme,
      routes:{
        AppPage.routeName:(context)=>AppPage(),
        CustomerPage.routeName:(context)=>CustomerPage(),
        VisitRecordPage.routeName:(context)=>VisitRecordPage(),
        CustomerChange.routeName:(context) =>CustomerChange()
      },
      home: LoginPage(),
    );
  }


  final ThemeData mDefaultTheme = new ThemeData(
    primaryColor: Colors.blue,
    splashColor: Colors.blue[300],
  );

}


