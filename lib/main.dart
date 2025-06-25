//import 'dart:html';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:national_identic/other_pages.dart';

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
    MediaQueryData queryData = MediaQuery.of(
      context,
    ); // тут операнда с размером экрана
    return MaterialApp(
      title: 'National Identic',
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          leading: DrawerButton(),
          title: const Text('National identic!'),
        ),
        body: Container(
          padding: EdgeInsets.all(queryData.size.width * 0.05),
          child: const MainPageContent(),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                'You can type interesting name on any language,'
                ' BUT working more stable this version of program with English Language. In future here may be settings and auto-translation, but not now',
              ),
              Spacer(),
              Text(
                'All percents is only probability of naming people in some countries',
              ),
              Container(height: 10),
              Text(
                'this app developed not for a sale, here used free API of side developers',
                style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
