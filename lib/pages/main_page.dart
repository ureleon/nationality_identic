import 'package:flutter/material.dart';
import 'package:national_identic/config/routes.dart';
import 'package:national_identic/widgets/cards_example.dart';
import 'package:national_identic/widgets/nationality_output.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late TextEditingController _controller;
  String name = '';
  late bool counter;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    counter = false;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xAAAA1111),
        shadowColor: Colors.redAccent.shade200,
        leading: const DrawerButton(),
        title: const Text('National identic!'),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 10),
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
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(child: _rightStart(assertation: name)),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  counter = !counter;
                });
              },
              child: cardsExample(
                titleText: 'Description',
                subTitleText: _subText(isOpen: counter),
              ),
            ),
            GestureDetector(
              onTap: () {
                const SettingsRoute().go(context);
              },
              child: cardsExample(titleText: 'Settings', subTitleText: ''),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

String _subText({final bool isOpen = false}) {
  //this small functions need's to show and hide full text
  if (isOpen) {
    return 'You can type interesting name on any language,'
        ' BUT working more stable this version of program with English Language.'
        ' In future here may be settings and auto-translation,'
        ' but not now All percents is only probability of naming people in some countries '
        'this app developed not for a sale, here used free API of side developers';
  }
  return '';
}

Widget _rightStart({required final String assertation}) {
  if (assertation.isNotEmpty) {
    return NatOutput(firstName: assertation);
  } else {
    return const Spacer();
  }
}
