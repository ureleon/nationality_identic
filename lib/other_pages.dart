import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:http/http.dart' as http;
import 'package:national_identic/nationality.dart';

class MainPageContent extends StatefulWidget {
  const MainPageContent({super.key});

  @override
  State<MainPageContent> createState() => _MainPageContentState();
}

class _MainPageContentState extends State<MainPageContent> {
  late TextEditingController _controller;
  late EmojiParser parser;
  String name = '';
  List<String> natCodes = <String>[];
  List<num> natProbs = <num>[];
  List<String> flagList = <String>[];

  @override
  void initState() {
    super.initState();
    super.didChangeDependencies();

    _controller = TextEditingController();
    parser = EmojiParser();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(
      context,
    ); // тут операнда с размером экрана
    return Column(
      children: <Widget>[
        SizedBox(height: queryData.size.width * 0.005),
        TextField(
          controller: _controller,
          onSubmitted: (final String inputName) {
            setState(() {
              name = inputName;
            });
          },
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Name',
          ),
        ),
        FutureBuilder<Nationality>(
          future: fetchNationality(),
          builder:
              (
                final BuildContext context,
                final AsyncSnapshot<Nationality> snapshot,
              ) {
                if (snapshot.hasData && snapshot.data!.country.isNotEmpty) {
                  final StringBuffer readyTextBuffer = StringBuffer();
                  final List<Country> snapData = snapshot.data!.country;
                  for (int o = 0; o < snapData.length; o++) {
                    readyTextBuffer.write(
                      ' ${parser.emojify(':flag-${snapData[o].countryId.toLowerCase()}:')} ${snapData[o].countryId}: ${(snapData[o].probability * 100).roundToDouble()}%\n',
                    );
                  }
                  return Text(
                    style: TextStyle(
                      fontSize: 14 + queryData.size.height * 0.005,
                    ),
                    readyTextBuffer.toString(),
                  );
                } else if (snapshot.hasError && name != '' ||
                    name != '' && snapshot.data!.country.isEmpty) {
                  return Text(
                    "I don't understand this name $name, Try another",
                  );
                }
                while (name == '') {
                  return const Spacer();
                }
                return const Spacer();
              },
        ),
      ],
    );
  }

  Future<Nationality> fetchNationality() async {
    if (name != '') {
      final http.Response responseNat = await http.get(
        Uri.parse('https://api.nationalize.io/?name=$name'),
      );
      if (responseNat.statusCode >= 200 && responseNat.statusCode < 300) {
        return Nationality.fromRawJson(responseNat.body);
        //throw Exception(response.statusCode);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw (responseNat.statusCode);
      }
    } else if (name == '') {}
    throw ("nat is goin' to do");
  }
}
