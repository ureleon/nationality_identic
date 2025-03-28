//import 'dart:html';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:national_identic/other_pages.dart';
//import 'package:national_identic/nationality.dart';
//import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context); // тут операнда с размером экрана
    return  MaterialApp(
      title: 'National Identic',
      home: Scaffold(
          appBar: AppBar(
            foregroundColor:Colors.white,
            backgroundColor: Colors.blue,
            leading: const Icon(Icons.menu,),
            title:const Text('National identic!',),
          ),
          body: Container(
              padding: EdgeInsets.all(queryData.size.width*0.05),
              child: const MainPageContent()),
          drawer: Drawer(child: Column(children:[
            Spacer(),
            Text("Here will be my help and settings"),
            HelpPage(),
            Spacer()
          ]
          ),),
      ),
    );
  }
}
