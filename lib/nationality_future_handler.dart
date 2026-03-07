import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:http/http.dart' as http;
import 'package:national_identic/cards_example.dart';
import 'package:national_identic/entity/country.dart';
import 'package:national_identic/entity/nationality.dart';

class NatOutput extends StatefulWidget {
  const NatOutput({super.key, required this.firstName});

  final String firstName;

  @override
  State<NatOutput> createState() => _NatOutputState();
}

class _NatOutputState extends State<NatOutput> {
  late EmojiParser parser;

  @override
  void initState() {
    super.initState();
    parser = EmojiParser();
  }

  @override
  Widget build(final BuildContext context) {
    if (widget.firstName.isNotEmpty) {
      return FutureBuilder<Nationality>(
        future: fetchNationality(),
        builder:
            (
              final BuildContext context,
              final AsyncSnapshot<Nationality> snapshot,
            ) {
              if (snapshot.hasData && widget.firstName.isNotEmpty) {
                final BuiltList<Country> snapData = snapshot.data!.country;
                final List<Widget> snapStrokes = <Widget>[];

                for (int o = 0; o < snapData.length; o++) {
                  snapStrokes.add(
                    cardsExample(
                      titleText: '',
                      subTitleText:
                          ' ${parser.emojify(':flag-${snapData[o].countryId.toLowerCase()}:')} ${snapData[o].countryId}: ${(snapData[o].probability * 100).roundToDouble()}%\n',
                    ),
                  );
                }
                return Column(
                  children: <Widget>[
                    Text(
                      'Name ${widget.firstName} is referenced ${snapshot.data!.count} times in our service',
                    ),
                    Column(children: snapStrokes),
                  ],
                );
              } else if (snapshot.hasError) {
                throw Exception('snapshot has error: ${snapshot.error}');
              }
              return const CircularProgressIndicator(color: Colors.redAccent);
            },
      );
    }
    return const Spacer();
  }

  Future<Nationality> fetchNationality() async {
    if (widget.firstName != '') {
      final http.Response responseNat = await http.get(
        Uri.parse('https://api.nationalize.io/?name=${widget.firstName}'),
      );
      if (responseNat.statusCode >= 200 && responseNat.statusCode < 300) {
        return Nationality.fromJson(
          json.decode(responseNat.body) as Map<String, Object?>,
        );
        //throw Exception(response.statusCode);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception(responseNat.statusCode);
      }
    } else if (widget.firstName == '') {}
    throw Exception('nat is going to do');
  }
}
