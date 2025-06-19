//import 'package:national_identic/main.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:national_identic/nationality.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_emoji/flutter_emoji.dart';
import 'dart:convert';

class MainPageContent extends StatefulWidget {
  const MainPageContent({super.key});

  @override
  State<MainPageContent> createState() => _MainPageContentState();
}

class _MainPageContentState extends State<MainPageContent> {
  late TextEditingController _controller;
  late EmojiParser parser;
  var name = '';
  List<String> natCodes = [];
  List<num> natProbs = [];
  List<String> flagList = [];

  @override
  void initState() {
    super.initState();
    super.didChangeDependencies();
    _controller = TextEditingController();
    name;
    natCodes;
    natProbs;
    parser = EmojiParser();

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context); // тут операнда с размером экрана
    return Column(
      children: [
        SizedBox(height: queryData.size.width * 0.005,),
        TextField(
          controller: _controller,
          onSubmitted: (String inputName) async {
            setState(() {
              name = inputName;
            });
          },
          obscureText: false,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Name",
          ),
        ),
        FutureBuilder<Nationality>(
            future: fetchNationality(),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.country.isNotEmpty) {
                String readyText = '';
                List<Country> snapData = snapshot.data!.country;
                for(int o = 0; o < snapData.length; o++){
                  readyText += ' ${
                      parser.emojify(':flag-${snapData[o].countryId.toLowerCase()}:')} ${
                      snapData[o].countryId}: ${(snapData[o].probability*100).roundToDouble()}%\n';
                }
                return Text(style:TextStyle(fontSize: 14+queryData.size.height*0.005),readyText);

              }
              else if (snapshot.hasError && name != '' || name !='' && snapshot.data!.country.isEmpty){
              return Text("I don't understand this name $name, Try another");
              }
              while(name ==''){
                return const Spacer();
              }
              return Spacer();
            }
        ),
      ],
    );
  }

  Future<Nationality> fetchNationality() async {
    if (name != '') {
      final responseNat = await http.get(
          Uri.parse('https://api.nationalize.io/?name=$name'));
      if (responseNat.statusCode >= 200 && responseNat.statusCode < 300) {
        return Nationality.fromJson(jsonDecode(responseNat.body));
        //throw Exception(response.statusCode);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw (responseNat.statusCode);
      }
    }
    else if (name == '') {}
    throw ("nat is goin' to do");
  }
  }