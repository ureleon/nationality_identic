import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:national_identic/models/country.dart';
import 'package:national_identic/models/nationality.dart';
import 'package:national_identic/services/nationality_service.dart';
import 'package:national_identic/widgets/cards_example.dart';

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
        future: fetchNationality(widget.firstName),
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
}
