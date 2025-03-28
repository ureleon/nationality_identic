//import 'package:national_identic/main.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:national_identic/nationality.dart';
//import 'package:national_identic/codenames.dart';
//import 'package:flutter/rendering.dart';
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
                  return Column(children: [
                    Text('${parser.emojify(':flag-${snapshot.data!.country[0].countryId.toLowerCase()}:')} ${snapshot.data!.country[0].countryId}: ${snapshot.data!.country[0].probability*100}%'),
                    Text('${parser.emojify(':flag-${snapshot.data!.country[1].countryId.toLowerCase()}:')} ${snapshot.data!.country[1].countryId}: ${snapshot.data!.country[1].probability*100}%'),
                    Text('${parser.emojify(':flag-${snapshot.data!.country[2].countryId.toLowerCase()}:')} ${snapshot.data!.country[2].countryId}: ${snapshot.data!.country[2].probability*100}%'),
                    Text('${parser.emojify(':flag-${snapshot.data!.country[3].countryId.toLowerCase()}:')} ${snapshot.data!.country[3].countryId}: ${snapshot.data!.country[3].probability*100}%'),
                    Text('${parser.emojify(':flag-${snapshot.data!.country[4].countryId.toLowerCase()}:')} ${snapshot.data!.country[4].countryId}: ${snapshot.data!.country[4].probability*100}%'),
                  ]
                  );
              }
              else if (snapshot.hasError && name != ''){
                late String errorNat = snapshot.error.toString();
                /*
                return AlertDialog(
                  title: const Text('App is broken at nat',),
                  actions: [
                    Text(
                        'Catched error in future of Nationality, and error is: $errorNat'
                    ),
                  ],
                );
                */
                print(errorNat);
                /*отключил обработчик ошибок, чтобы не пердело
                 при обновлении MainPageContentState. Надо переделать!!!
                 */
                //return const CircularProgressIndicator();
              return Text("I don't understand this name $name, Try another");
              }
              return const Spacer();
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
  class HelpPage extends StatelessWidget {
    const HelpPage({super.key});

    @override
    Widget build(BuildContext context) {
      return Text("See'n you later");
    }
  }
